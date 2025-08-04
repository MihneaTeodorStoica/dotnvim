# dotnvim

Neovim configuration focusing on C/C++ development and competitive programming.

## Features

- **LSP** via [clangd](https://clangd.llvm.org/) using `mason.nvim` and `nvim-lspconfig`.
- **Autocompletion** powered by `nvim-cmp` with snippet support.
- **Treesitter** syntax highlighting and indentation for C/C++ and other languages.
- **Telescope** fuzzy finder for files and grep.
- **AutoPairs** and comment toggling for faster editing.
- **Git integration** with inline signs via `gitsigns.nvim`.
- **Keymap hints** powered by `which-key.nvim`.
- **Competitive programming helpers** via [`competitest.nvim`](https://github.com/xeluxee/competitest.nvim) with persistent testcase receiver.
- Problems received from the browser are saved to `~/Documents/Programming/<PLATFORM>/<CONTEST>/<PROBLEM>/main.cpp`.

## Usage

Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/MihneaTeodorStoica/dotnvim.git ~/.config/nvim
```

Launch Neovim and the plugin manager will download the required plugins automatically.

Common mappings:

| Mapping | Description |
| ------- | ----------- |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `gd` | Go to definition |
| `<leader>rn` | Rename symbol |
| `<leader>w` | Save file |
| `<S-l>`/`<S-h>` | Next/previous buffer |
| `<leader>tr` | Run testcases |
| `<leader>ta` | Add testcase |
| `<leader>tp` | Receive problem from browser |

Ensure you have `clangd` and any required compilers installed on your system. You can manage LSP servers through `:Mason`.
