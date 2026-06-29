#!/usr/bin/env lua

local function read_file(path)
    local f = io.open(path, "r")
    if not f then return nil end
    local content = f:read("*a")
    f:close()
    return content:match("^%s*(.-)%s*$") -- trim whitespace
end

local function exec(cmd)
    local handle = io.popen(cmd .. " 2>/dev/null")
    if not handle then return nil end
    local result = handle:read("*a")
    handle:close()
    return result:match("^%s*(.-)%s*$")
end

local function has_battery()
    local result = exec("ls /sys/class/power_supply/")
    if not result then return false end
    for entry in result:gmatch("%S+") do
        if entry:match("^BAT") then return true end
    end
    return false
end

local function get_chassis_type()
    return read_file("/sys/class/dmi/id/chassis_type")
end

local function get_hostname()
    return read_file("/etc/hostname") or exec("hostname")
end

local function get_cpu()
    local cpuinfo = read_file("/proc/cpuinfo")
    if not cpuinfo then return "unknown" end
    return cpuinfo:match("model name%s*:%s*(.-)%n") or "unknown"
end

local function get_gpu()
    return exec("lspci | grep -i 'vga\\|3d\\|display'")
end

local function get_ram_gb()
    local meminfo = read_file("/proc/meminfo")
    if not meminfo then return "unknown" end
    local kb = meminfo:match("MemTotal:%s*(%d+)")
    if kb then
        return string.format("%.1f GB", tonumber(kb) / 1024 / 1024)
    end
    return "unknown"
end

-- Chassis type IDs that indicate a laptop
local laptop_chassis = { [8]=true, [9]=true, [10]=true, [11]=true, [14]=true, [31]=true }

local chassis_id = tonumber(get_chassis_type())
local battery = has_battery()

local device_type
if battery or (chassis_id and laptop_chassis[chassis_id]) then
    device_type = "laptop"
else
    device_type = "desktop"
end

print("=== Device Info ===")
print("Hostname    : " .. (get_hostname() or "unknown"))
print("Type        : " .. device_type)
print("Chassis ID  : " .. (get_chassis_type() or "unknown"))
print("Battery     : " .. (battery and "yes" or "no"))
print("CPU         : " .. get_cpu())
print("RAM         : " .. get_ram_gb())
print("")
print("=== GPU(s) ===")
print(get_gpu() or "unknown")
