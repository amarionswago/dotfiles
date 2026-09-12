#!/bin/sh

WALL_DIR="${HYPR_WALLPAPER_DIR:-$HOME/.config/hypr/wallpapers}"
STATE="${XDG_STATE_HOME:-$HOME/.local/state}/hypr-wallpaper"

mkdir -p "$(dirname "$STATE")"

if [ -n "$HYPR_WALLPAPER" ]; then
	IMG="$HYPR_WALLPAPER"
elif [ "$1" = "--next" ]; then
	CURRENT="$(cat "$STATE" 2>/dev/null)"
	IMG="$(
		find "$WALL_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort | awk -v current="$CURRENT" '
			NR == 1 { first = $0 }
			found { print; printed = 1; exit }
			$0 == current { found = 1 }
			END { if (!printed && first) print first }
		'
	)"
else
	IMG="$(cat "$STATE" 2>/dev/null)"
	if [ ! -f "$IMG" ]; then
		IMG="$(find "$WALL_DIR" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort | head -n 1)"
	fi
fi

if [ ! -f "$IMG" ]; then
	exit 0
fi

printf '%s\n' "$IMG" > "$STATE"

if ! command -v awww >/dev/null 2>&1; then
	exit 0
fi

pkill hyprpaper 2>/dev/null || true

if ! pgrep -x awww-daemon >/dev/null 2>&1; then
	awww-daemon --quiet --no-cache >/dev/null 2>&1 &
	sleep 0.5
fi

awww img --transition-type wipe --transition-duration 0.35 --resize crop "$IMG"
