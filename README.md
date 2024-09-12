## NeoVim
### Parepre Settings
1. ln -s init.vim ~/.config/nvim/
3. ln -s coc-settings.json ~/.config/nvim/

### Install dependencies
- Install nvim: pip3 install neovim
- Install nodejs for coc.nvim
- Install llvm/clangd for coc.nvim
- Install ctags for tagbar
- Install jedi for python

### Install plug-vim & plugins
> curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

1. :PlugInstall
2. :GoInstallBinaries
3. :CocInstall coc-go
4. :CocInstall coc-clangd
5. :CocInstall coc-rust-analyzer
6. :CocInstall coc-html/css/eslint/json etc

### For Vim(version >= 8.19)
1. change ~/.config/nvim/init.vim to ~/.vimrc  
2. change .config/nvim/* to .vim/*
