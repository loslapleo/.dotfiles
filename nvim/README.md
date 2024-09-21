# Neovim .dotfiles

## Requirements

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [Neovim](https://neovim.io/)

Please make sure you meet the requirements of the above requirements. For example, **lazy.nvim** requires a certain version of **Neovim** specified in their documentation.

## Included plugins

This is a list of plugins included in this **Neovim** configuration. You can edit these configurations by changing information in the `lua/plugins/` directory.

### [autopairs](https://github.com/windwp/nvim-autopairs)

Auto completes pairs such as *{}*, *[]*, and *()*.

### [cmp](https://github.com/hrsh7th/nvim-cmp)

Auto complete code using the **lsp-zero** suggestions.

| Keymap | Function |
| - | - |
| `Enter` | Complete word with highlighted suggestion or first suggestion (if no suggestion highlighted). |
| `Tab` / `Down` | Selects the next suggestion. |
| `Ctrl-Tab` / `Up` | Selects the previous suggestion. |

### [gitsigns](https://github.com/lewis6991/gitsigns.nvim)

Shows **Git** decorations about what information was added, changed, or removed.

### [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

Adds indentation guides.

### [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)

An lsp manager that is used to get suggestions for our **cmp** plugin and find errors and warnings for our **trouble** plugin.

### [lualine](https://github.com/nvim-lualine/lualine.nvim)

TODO

### [nord](https://github.com/shaunsingh/nord.nvim)

TODO

### [telescope](https://github.com/nvim-telescope/telescope.nvim)

TODO

### [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

TODO

### [trouble](https://github.com/folke/trouble.nvim)

TODO

### [vimtex](https://github.com/lervag/vimtex)

TODO
