#!/usr/bin/env sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_src="$repo_dir/.config"
config_dst="$HOME/.config"

info() {
	printf '%s\n' "==> $*"
}

sync_dir() {
	src="$1"
	dst="$2"
	mkdir -p "$dst"
	if command -v rsync >/dev/null 2>&1; then
		rsync -a --delete "$src/" "$dst/"
	else
		cp -R "$src/." "$dst/"
	fi
}

install_arch_packages() {
	if ! command -v pacman >/dev/null 2>&1; then
		return
	fi

	info "Installing common Arch packages"
	sudo pacman -S --needed \
		git base-devel neovim ripgrep fd fzf unzip \
		hyprland waybar kitty rofi wofi mako hyprpaper \
		grim slurp wl-clipboard \
		fastfetch starship cava tmux \
		clang cmake make gdb lldb python nodejs npm
}

info "Installing config files"
mkdir -p "$config_dst"

for dir in nvim hypr kitty waybar rofi wofi mako cava fastfetch fontconfig gtk-3.0 tmux; do
	if [ -d "$config_src/$dir" ]; then
		sync_dir "$config_src/$dir" "$config_dst/$dir"
	fi
done

for file in .zshrc .tmux.conf; do
	if [ -f "$repo_dir/$file" ]; then
		cp "$repo_dir/$file" "$HOME/$file"
	fi
done

if [ -f "$config_src/starship.toml" ]; then
	cp "$config_src/starship.toml" "$config_dst/starship.toml"
fi

mkdir -p "$HOME/.local/state"

install_arch_packages

if command -v nvim >/dev/null 2>&1; then
	info "Syncing Neovim plugins"
	nvim --headless '+Lazy! sync' '+MasonInstall clangd codelldb pyright typescript-language-server html-lsp css-lsp tailwindcss-language-server svelte-language-server graphql-language-service-cli emmet-ls taplo' '+qa' || true
fi

if command -v fc-cache >/dev/null 2>&1; then
	info "Refreshing font cache"
	fc-cache -f "$HOME/.local/share/fonts" "$HOME/.fonts" >/dev/null 2>&1 || true
fi

if command -v hyprctl >/dev/null 2>&1 && [ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
	info "Reloading Hyprland"
	hyprctl reload >/dev/null 2>&1 || true
fi

if command -v pgrep >/dev/null 2>&1 && command -v kill >/dev/null 2>&1; then
	for pid in $(pgrep -x kitty 2>/dev/null || true); do
		kill -USR1 "$pid" 2>/dev/null || true
	done
fi

info "Done"
