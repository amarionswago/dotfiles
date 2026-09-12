# Personal Dotfiles

Personal Hyprland, terminal, shell, and Neovim setup.

This repo is meant to make a new Linux install feel familiar quickly: copy the config, install the common tools, sync Neovim, and keep the desktop/editor workflow compact.

## What's Included

- `hypr/` - Hyprland session, binds, monitor layout, wallpaper cycling, and window rules.
- `waybar/` - top bar layout and modules.
- `kitty/` - terminal font, monochrome palette, cursor trail, and faint background mark.
- `nvim/` - C/C++ focused Neovim config with LSP, Telescope, DAP, Treesitter, lualine, transparent backgrounds, and cursor smear.
- `tmux/` - bottom status strip used by the `nv` helper.
- `rofi/` and `wofi/` - launchers.
- `mako/` - notifications.
- `cava/` - audio visualizer config and shaders.
- `fastfetch/` - compact system summary.
- `fontconfig/` and `gtk-3.0/` - desktop font and GTK preferences.
- `.zshrc`, `.tmux.conf`, and `.config/starship.toml` - shell, prompt, and terminal workflow.

## Install

On a new system:

```sh
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer is intentionally direct. It overwrites the matching config files in your home directory with the versions from this repo.

## Main Shortcuts

| Key | Action |
| --- | --- |
| `SUPER + Return` | Open Kitty |
| `SUPER + D` | App launcher |
| `SUPER + Q` | Close active window |
| `SUPER + Shift + Q` | Exit Hyprland |
| `SUPER + H/J/K/L` | Move focus |
| `SUPER + Shift + H/J/K/L` | Move window |
| `SUPER + F` | Toggle floating |
| `SUPER + R` | Reload Hyprland |
| `SUPER + W` | Cycle wallpaper |
| `SUPER + Shift + R` | Refresh current wallpaper |

## Neovim Workflow

Open Neovim from the project root:

```sh
cd ~/path/to/project
nvim .
```

Use `nv` when `tmux` is installed and you want the bottom `[main] [nvim]` strip:

```sh
nv
```

Useful bindings:

| Key | Action |
| --- | --- |
| `<Space>ff` | Find files |
| `<Space>fw` | Live grep |
| `<Space>fs` | Document symbols |
| `<Space>fc` | Search word under cursor |
| `<C-n>` | Toggle file tree |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<Space>x` | Close current buffer |
| `gd`, `gD`, `gi`, `gt` | LSP navigation |
| `<Space>ca` | Code action |
| `<Space>rn` | Rename symbol |
| `<Space>d` / `<Space>D` | Line / buffer diagnostics |
| `<Space>dc` | Continue debugger |
| `<Space>db` | Toggle breakpoint |
| `<Space>du` | Toggle debugger UI |

## C/C++ Loop

```sh
cmake -S . -B build
cmake --build build
ctest --test-dir build
```

C and C++ buffers format through `clangd` on save.
