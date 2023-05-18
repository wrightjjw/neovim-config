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
[ ] Enable "snippet skipping": using tab to go to next part of snippet
[ ] Find keybind that allows `<cr>` without inputting a cmp suggestion.

## Windows
Supported on Windows as much as possible.
Please enable developer mode as Packer requires it for symlinks.

### Known Windows Issues
None as of now!
