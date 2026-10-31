# Neovim config

[LazyVim](https://www.lazyvim.org/) with Zig completion, diagnostics, a file sidebar, and mouse support.

## Setup

Move any existing Neovim config out of the way before cloning.

```sh
brew install neovim zig zls ripgrep fd
git clone https://github.com/adxdits/vim-config.git ~/.config/nvim
nvim .
```

Let the plugins install, then restart Neovim. Zig and ZLS need compatible versions.

## Shortcuts

- `Ctrl+B`: toggle the file sidebar.
- `Ctrl+N` in normal mode: create a named file.
- `Ctrl+S`: save.
- `Ctrl+P`: find a file.
- Double-click a sidebar file to open it.
- `a` in the sidebar: add a file or directory.
- `r` in the sidebar: rename.
- `Esc`: return to normal mode.
