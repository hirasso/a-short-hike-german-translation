#!/usr/bin/env bash
#
# Installs the German translation of "A Short Hike" into the game's Steam
# install, regardless of where this repo was cloned to. macOS only.
#
# Usage:
#   ./install.sh                          Install via symlink to the default Steam location
#   ./install.sh --copy                   Install via copy instead of symlink
#   ./install.sh "/path/to/A Short Hike"  Override the game folder (the one containing AShortHike.app)
#   ./install.sh -f | --force             Skip the overwrite confirmation prompt
#   ./install.sh -h | --help              Show this help

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="$REPO_DIR/LANG_German.yarn_lines.csv"

DEFAULT_GAME_DIR="$HOME/Library/Application Support/Steam/steamapps/common/A Short Hike"
GAME_DIR="$DEFAULT_GAME_DIR"

METHOD="symlink"
FORCE=0

print_help() {
    sed -n '2,12p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --copy)
            METHOD="copy"
            shift
            ;;
        -f|--force)
            FORCE=1
            shift
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        -*)
            echo "Unknown option: $1" >&2
            print_help
            exit 1
            ;;
        *)
            GAME_DIR="$1"
            shift
            ;;
    esac
done

CONTENTS_DIR="$GAME_DIR/AShortHike.app/Contents"
DEST_FILE="$CONTENTS_DIR/LANG_German.yarn_lines.csv"

if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "error: couldn't find LANG_German.yarn_lines.csv next to this script ($REPO_DIR)." >&2
    exit 1
fi

if [[ ! -f "$CONTENTS_DIR/_LANG_Custom.yarn_lines.csv" ]]; then
    echo "error: couldn't find the game at:" >&2
    echo "  $CONTENTS_DIR" >&2
    echo >&2
    echo "If Steam installed the game somewhere else, find the game folder via" >&2
    echo "Steam > A Short Hike > Manage > Browse Local Files, then run:" >&2
    echo "  ./install.sh \"/path/to/A Short Hike\"" >&2
    exit 1
fi

if [[ -e "$DEST_FILE" || -L "$DEST_FILE" ]]; then
    if [[ $FORCE -ne 1 ]]; then
        echo "A file already exists at:"
        echo "  $DEST_FILE"
        if [[ -L "$DEST_FILE" ]]; then
            echo "  (symlink -> $(readlink "$DEST_FILE"))"
        fi
        read -r -p "Overwrite it? [y/N] " reply
        case "$reply" in
            [yY]|[yY][eE][sS]) ;;
            *)
                echo "Aborted, nothing changed."
                exit 1
                ;;
        esac
    fi
    rm -f "$DEST_FILE"
fi

if [[ "$METHOD" == "symlink" ]]; then
    ln -s "$SOURCE_FILE" "$DEST_FILE"
    echo "Symlinked $DEST_FILE -> $SOURCE_FILE"
else
    cp "$SOURCE_FILE" "$DEST_FILE"
    echo "Copied translation to $DEST_FILE"
fi

echo
echo "Done! Launch A Short Hike, then select German from the language"
echo "option in the game's settings menu."
