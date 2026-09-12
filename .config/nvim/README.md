# Personal Neovim Config

A focused Neovim setup for day-to-day C/C++ and general coding, with fast navigation, LSP-backed editing, debugging, file browsing, transparent terminal visuals, and a theme workflow that is easy to switch without touching config files.

## Highlights

- Plugin management through [lazy.nvim](https://github.com/folke/lazy.nvim), bootstrapped automatically on first launch.
- Fuzzy finding, live grep, references, implementations, and diagnostics through Telescope.
- LSP setup for C/C++, TypeScript, web files, GraphQL, Svelte, and Python.
- Completion with `nvim-cmp`, LuaSnip snippets, path suggestions, buffer words, and LSP sources.
- Treesitter highlighting for common web, systems, scripting, and markdown filetypes.
- C/C++ debugging through `nvim-dap`, with LLDB or CodeLLDB auto-detection.
- A custom theme picker with persisted selection and quick next/previous theme commands.
- Practical UI touches: file tree, bufferline, lualine, diagnostics, folds, markdown rendering, indent guides, cursor smear, and transparent editor backgrounds.

## Install

Back up your existing config first, then clone this repo into Neovim's config directory:

```sh
git clone <repo-url> ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` installs itself and then installs the configured plugins.

### External tools

Some features work best when these tools are available on your `PATH`:

- `git`, `make`, and a C compiler for native plugin builds.
- Language servers such as `clangd`, `ts_ls`, `pyright`, `html`, `cssls`, `tailwindcss`, `svelte`, `graphql`, and `emmet_ls`.
- `lldb-dap` or `codelldb` for debugging C and C++.
- `tmux` is optional. When installed, the shell `nv` helper opens Neovim inside a `main` session with a bottom status strip.

## Workflow

Open Neovim from the project root so Telescope, clangd, diagnostics, debug paths, and build tooling see the same workspace:

```sh
cd ~/path/to/project
nvim .
```

For the terminal status-bar workflow, use:

```sh
nv
```

The daily C/C++ loop is intentionally plain:

```sh
cmake -S . -B build
cmake --build build
ctest --test-dir build
```

Use Telescope for movement across the project, LSP for code navigation, and DAP when you need an interactive debugger. C and C++ buffers format through `clangd` on save.

## Keybindings

Leader is `<Space>`. `<C-n>` means hold `Ctrl` and press `n`.

### Buffers, Tabs, and Splits

Bufferline shows open buffers across the top of the editor. These are the file-like tabs you switch through during normal work.

| Key | Action |
| --- | --- |
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Delete / close the current buffer |
| `<leader>X` | Force-delete the current buffer |
| `<leader>h` | Move current buffer left |
| `<leader>l` | Move current buffer right |
| `<leader>n` | Open a real Vim tab page |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>sx` | Close current split |
| `<leader>se` | Equalize split sizes |

### Main Commands

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fs` | Document symbols |
| `<leader>fc` | Search word under cursor |
| `<C-n>` | Toggle file tree |
| `<leader>e` | Toggle file tree |
| `<leader>E` | Focus file tree |
| `<leader>ts` | Select theme |
| `<leader>tn` / `<leader>tp` | Next / previous theme |
| `gd`, `gD`, `gi`, `gt` | LSP navigation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>d` / `<leader>D` | Line / buffer diagnostics |
| `<leader>dc` | Continue debugger |
| `<leader>db` | Toggle breakpoint |
| `<leader>ds`, `<leader>di`, `<leader>do` | Step over / into / out |
| `<leader>du` | Toggle debugger UI |

## Structure

```text
init.lua                 Entry point
lua/user/core/          Options, keymaps, theme state, filetype setup
lua/user/plugins/       Plugin specs
lua/user/plugins/lsp/   LSP and Mason setup
lua/user/tools/         Small local helper tools
```
