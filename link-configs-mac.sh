#!/usr/bin/env bash

# Compatible with the Bash 3.2 and BSD utilities included with macOS.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_BASE="${DOTFILES_DIR}/config"
TARGET_BASE="${XDG_CONFIG_HOME:-${HOME}/.config}"
ROOT_FILE_CANDIDATES=(bashrc zshrc profile gitconfig tmux.conf)
DRY_RUN=false
FORCE=false
LINK_ALL=false
ITEMS=()

usage() {
  cat <<'EOF'
Usage:
  ./link-configs-mac.sh [options] <item> [item...]

Examples:
  ./link-configs-mac.sh nvim zshrc gitconfig
  ./link-configs-mac.sh --all
  ./link-configs-mac.sh --dry-run nvim

Options:
  -a, --all      Link config folders and common root dotfiles
  -f, --force    Remove existing destination instead of backing it up
  -n, --dry-run  Show actions without making changes
  -h, --help     Show this help text
EOF
}

run_cmd() {
  if [[ "${DRY_RUN}" == true ]]; then
    printf '[dry-run] %s\n' "$*"
  else
    "$@"
  fi
}

resolve_items() {
  local path
  local file
  local folder_names=()
  local root_files=()

  if [[ "${LINK_ALL}" == true ]]; then
    # Avoid GNU find's -printf and Bash 4's mapfile, neither of which is
    # available in a stock macOS environment.
    while IFS= read -r path; do
      folder_names+=("${path##*/}")
    done < <(find "${SOURCE_BASE}" -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort)

    for file in "${ROOT_FILE_CANDIDATES[@]}"; do
      if [[ -f "${DOTFILES_DIR}/${file}" ]]; then
        root_files+=("${file}")
      fi
    done

    ITEMS=("${folder_names[@]}" "${root_files[@]}")
  fi
}

parse_args() {
  while (($# > 0)); do
    case "$1" in
      -a|--all)
        LINK_ALL=true
        shift
        ;;
      -f|--force)
        FORCE=true
        shift
        ;;
      -n|--dry-run)
        DRY_RUN=true
        shift
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      --)
        shift
        break
        ;;
      -*)
        printf 'Unknown option: %s\n\n' "$1" >&2
        usage
        exit 1
        ;;
      *)
        break
        ;;
    esac
  done

  ITEMS=("$@")
}

parse_args "$@"

if [[ ! -d "${SOURCE_BASE}" ]]; then
  printf 'Source directory not found: %s\n' "${SOURCE_BASE}" >&2
  exit 1
fi

resolve_items

if [[ ${#ITEMS[@]} -eq 0 ]]; then
  printf 'No items provided. Pass names or use --all.\n\n' >&2
  usage
  exit 1
fi

run_cmd mkdir -p "${TARGET_BASE}"

timestamp="$(date +%Y%m%d%H%M%S)"
missing=0

for item in "${ITEMS[@]}"; do
  src=""
  dst=""

  if [[ -d "${SOURCE_BASE}/${item}" ]]; then
    src="${SOURCE_BASE}/${item}"
    dst="${TARGET_BASE}/${item}"
  elif [[ -f "${DOTFILES_DIR}/${item}" ]]; then
    src="${DOTFILES_DIR}/${item}"
    if [[ "${item}" == .* ]]; then
      dst="${HOME}/${item}"
    else
      dst="${HOME}/.${item}"
    fi
  else
    printf 'Skipping missing item: %s\n' "${item}" >&2
    missing=1
    continue
  fi

  if [[ -L "${dst}" ]]; then
    existing_target="$(readlink "${dst}")"
    if [[ "${existing_target}" == "${src}" ]]; then
      printf 'Already linked: %s -> %s\n' "${dst}" "${src}"
      continue
    fi
  fi

  if [[ -e "${dst}" || -L "${dst}" ]]; then
    if [[ "${FORCE}" == true ]]; then
      printf 'Removing existing destination: %s\n' "${dst}"
      run_cmd rm -rf "${dst}"
    else
      backup="${dst}.bak.${timestamp}"
      printf 'Backing up existing destination: %s -> %s\n' "${dst}" "${backup}"
      run_cmd mv "${dst}" "${backup}"
    fi
  fi

  printf 'Linking: %s -> %s\n' "${dst}" "${src}"
  run_cmd ln -s "${src}" "${dst}"
done

if [[ "${missing}" -ne 0 ]]; then
  exit 1
fi

printf 'Done.\n'
