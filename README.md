# nvim

requires neovim `0.12` or later.

## dependencies

system packages:
```bash
sudo apt install git ripgrep fzf fd-find luarocks
```

tree-sitter cli (needed to compile parsers):
```bash
npm install -g tree-sitter-cli
```

## setup

open neovim and install language servers:
```vim
:MasonInstall pyright lua-language-server bash-language-server clangd rust-analyzer efm
```

install formatters and linters:
```vim
:MasonInstall black flake8 stylua luacheck clang-format cpplint shellcheck shfmt
```

additional servers and tools are commented out in `init.lua` — uncomment and install as needed:
```vim
:MasonInstall typescript-language-server gopls prettier prettierd eslint_d fixjson gofumpt revive
```
