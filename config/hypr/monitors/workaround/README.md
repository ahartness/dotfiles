# Hyprland Monitor Layout Workaround

This directory contains a temporary workaround for a Hyprland/Aquamarine crash that occurs when enabling or hot-plugging the `DP-2` monitor.

The affected setup uses:

- Hyprland `0.56.0`
- Aquamarine `0.13.0`
- NVIDIA `610.43.03`
- NVIDIA GeForce RTX 3070 Ti
- `DP-1`: AOC Q27G3XMN, 2560x1440
- `DP-2`: Gigabyte G34WQC, 3440x1440

## Symptoms

Hyprland may crash when:

- `DP-2` is connected after Hyprland starts
- switching from a single-monitor layout to a dual-monitor layout
- switching between layouts by replacing a symlinked monitor configuration
- a monitor is declared as persistently disabled and then becomes connected

The crash report shows the fault occurring in Aquamarine's DRM output commit path:

```text
Aquamarine::SDRMConnector::releaseStashedCommit()
Aquamarine::CDRMOutput::commitState()
Render::IHyprRenderer::commitPendingAndDoExplicitSync()
```

The compositor log also showed a failed atomic DRM test commit immediately before the crash.

## Root cause

The crash is caused by an Aquamarine output-state bug involving failed or stashed DRM commits during monitor hotplug or reconfiguration.

The issue is aggravated by two configuration problems that were present in the original dotfiles:

1. `DP-2` was configured as `3440x1400`, but its actual native resolution is `3440x1440`.
2. Layouts were switched using `ln -sf`, while some layouts declared the inactive monitor with `disabled = true`.

This could cause Hyprland to observe multiple configuration and output-state transitions while Aquamarine was processing a monitor connection event.

## Upstream status

An upstream Aquamarine change removes the problematic stashed-commit behavior:

```text
drm: do not stash failed commits
```

The fix was merged after Aquamarine `0.13.0`, so it is not present in the stable package used when this workaround was created.

This workaround can be removed or simplified after the fix reaches the stable Hyprland/Aquamarine packages used by this system.

## Workaround

The workaround makes three changes:

1. Monitor layout files are copied into place using an atomic rename instead of changing a symlink.
2. Single-monitor layouts do not contain persistent `disabled = true` rules for disconnected outputs.
3. The unused output is disabled with `hyprctl keyword monitor` only after the replacement configuration has loaded.

Conservative refresh rates are also used temporarily:

- `DP-1`: 2560x1440 at 120 Hz
- `DP-2`: 3440x1440 at 100 Hz

After the upstream fix reaches stable packages, these can be returned to their preferred refresh rates.

## Files

```text
monitors/
├── dual.lua
├── single.lua
├── ultrawide.lua
└── switch_layout.sh

modules/
└── monitors.lua
```

`modules/monitors.lua` is now a regular generated file rather than a persistent symlink.

The source layouts remain in `monitors/`.

## Switching layouts

Use:

```bash
~/.config/hypr/monitors/switch_layout.sh single
~/.config/hypr/monitors/switch_layout.sh dual
~/.config/hypr/monitors/switch_layout.sh ultrawide
```

The script:

1. validates the requested layout
2. copies it into a temporary file
3. atomically renames it to `modules/monitors.lua`
4. reloads Hyprland once
5. disables an unused output when required

## First-time migration

The previous implementation created `modules/monitors.lua` as a symlink.

Remove that symlink once before using the updated script:

```bash
rm -f ~/.config/hypr/modules/monitors.lua
~/.config/hypr/monitors/switch_layout.sh single
```

Verify that it is now a regular file:

```bash
file ~/.config/hypr/modules/monitors.lua
```

Expected result:

```text
Lua script, ASCII text
```

It should not report `symbolic link`.

## Layout details

### Single monitor

The single-monitor layout only declares `DP-1`.

It deliberately does not declare `DP-2` as disabled:

```lua
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@120.00",
    position = "0x0",
    scale = "1",
})
```

After the configuration reloads, the switch script runs:

```bash
hyprctl keyword monitor "DP-2,disable"
```

### Dual monitor

The dual layout declares both outputs using valid modes:

```lua
hl.monitor({
    output = "DP-1",
    mode = "2560x1440@120.00",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "DP-2",
    mode = "3440x1440@100.00",
    position = "0x-1440",
    scale = "1",
})
```

`DP-2` is stacked directly above `DP-1`.

Because both displays are 1440 pixels tall, the correct vertical offset is:

```text
0x-1440
```

The previous `3440x1400` mode was invalid and made the intended geometry inconsistent.

### Ultrawide only

The ultrawide layout only declares `DP-2`:

```lua
hl.monitor({
    output = "DP-2",
    mode = "3440x1440@100.00",
    position = "0x0",
    scale = "1",
})
```

After the configuration reloads, the switch script disables `DP-1`.

## Testing

Test the workaround in this order:

1. Start Hyprland with both monitors already connected.
2. Select the dual layout.
3. Switch from dual to single.
4. Switch from single back to dual.
5. Start Hyprland with `DP-2` disconnected.
6. Connect `DP-2`.
7. Select the dual layout.

Check the active monitors with:

```bash
hyprctl monitors all
```

Check recent Hyprland messages with:

```bash
journalctl --user -b --grep='Hyprland|aquamarine'
```

Check for NVIDIA kernel errors with:

```bash
journalctl -b -k --grep='NVRM|Xid|nvidia-drm|nvidia-modeset'
```

## Raising refresh rates

Once the workaround is stable, refresh rates can be tested incrementally.

For `DP-2`:

```lua
mode = "3440x1440@100.00"
```

Then test:

```lua
mode = "3440x1440@144.00"
```

For `DP-1`:

```lua
mode = "2560x1440@120.00"
```

Then test:

```lua
mode = "2560x1440@180.00"
```

Change one monitor at a time so any regression can be isolated.

VRR and HDR should remain disabled during initial testing and be re-enabled only after fixed-refresh operation is stable.

## Removing the workaround

After upgrading to stable packages that contain the Aquamarine fix:

1. update Hyprland and Aquamarine together
2. confirm the installed versions
3. test DP-2 hotplugging
4. restore preferred refresh rates
5. optionally return monitor disabling to the Lua layout files
6. keep atomic file replacement unless symlink-based reloading is specifically required

Check versions with:

```bash
pacman -Q hyprland aquamarine hyprutils hyprlang hyprcursor nvidia-utils
hyprctl systeminfo
```

Do not independently downgrade or replace only one component of the Hyprland/Aquamarine stack.

## Collecting crash information

If the crash occurs again, collect:

```bash
mkdir -p ~/hypr-crash-debug

cp ~/.cache/hyprland/hyprlandCrashReport*.txt \
    ~/hypr-crash-debug/ 2>/dev/null

journalctl --user -b \
    > ~/hypr-crash-debug/user-journal-current-boot.log

journalctl -b -k \
    > ~/hypr-crash-debug/kernel-current-boot.log

coredumpctl info Hyprland \
    > ~/hypr-crash-debug/hyprland-coredump-info.log

hyprctl systeminfo \
    > ~/hypr-crash-debug/hypr-systeminfo.txt
```

The most relevant crash signature is:

```text
SDRMConnector::releaseStashedCommit
CDRMOutput::commitState
commitPendingAndDoExplicitSync
```

## Notes

The NVIDIA kernel log did not show an `Xid`, GPU reset, or GPU-fallen-off-the-bus event during the investigated crash.

That makes a compositor/Aquamarine state-management bug more likely than a physical monitor, cable, or GPU failure.

A separate NVIDIA warning indicated that the following obsolete module parameter was being ignored:

```text
NVreg_UsePageAttributeTable
```

It can be removed from the system's NVIDIA module configuration, but it is not considered the primary cause of this monitor crash.
