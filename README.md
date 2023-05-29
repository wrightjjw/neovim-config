# Josh's Neovim Config
Friendship ended with Emacs; now Neovim is my best friend.

## Installation
On Unix: 
```
git clone https://github.com/wrightjjw/neovim-config ~/.config/nvim
```

On Windows (PowerShell):
```
git clone https://github.com/wrightjjw/neovim-config ~/AppData/Local/nvim
```
Follow the quickstart instructions for
[Packer](https://github.com/wbthomason/packer.nvim#quickstart), then run
`:PackerSync` to set up plugins.

## Features
- Configuration is mindful of
[VSCode extension](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim).
I don't regularly use VSCode, but I try to keep it usable!
- Included config for [Neovide](https://neovide.dev/).
I *do* regularly use Neovide.
- Package management with Packer and Mason
- LSP and completion configuration
- Snippets with [LuaSnip](https://github.com/L3MON4D3/LuaSnip) and [cmp](https://github.com/hrsh7th/nvim-cmp)
- Git interface via [Neogit](https://github.com/TimUntersberger/neogit)
- More!

## Todo List
- [ ] Find keybind that allows `<cr>` without inputting a cmp suggestion.
- [x] Disable tag completion in not html jsx
- [ ] DAP Mode, especially for NodeJS

## Windows
Supported on Windows as much as possible.
Please enable developer mode as Packer requires it for symlinks.

### Known Windows Issues
None as of now!
