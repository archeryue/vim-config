## NeoVim
### ln -s vim-config/init.vim ~/.config/nvim/init.vim
1. cp go.snippets to ~/.config/nvim/UltiSnips/

### Install plug-vim
> curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

1. :PlugInstall
2. :GoInstallBinaries
3. install nodejs
4. cp coc-settings.json to ~/.config/nvim/
5. :CocInstall coc-clangd // for extensions
6. :CocInstall coc-rust-analyzer

### Install dependencies
- pip3 install neovim
- install everything else vim can not find: llvm/clangd/ctags and so on

### For Vim(version >= 8.19)
1. 把 ~/.config/nvim/init.vim 替换为 ~/.vimrc  
2. 把配置中的 .config/nvim/* 替换为 .vim/*
