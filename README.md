## NeoVim
### ln -s vim-config/vimrc ~/.config/nvim/init.vim
> vimrc 是从网上找了一份相对简单的版本，然后根据需求定制的  
> 原版是针对 Golang 做的配置，我加入了一些常用的 C/C++ 配置  
> 再根据习惯加了一些注释啊、跳转啊什么的  

### Install plug-vim
> curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

1. :PlugInstall
2. :GoInstallBinaries
3. install nodejs
4. cp coc-settings.json to ~/.config/nvim/
5. cp go.snippets to ~/.config/nvim/UltiSnips/  

### Install dependencies
- pip3 install neovim
- install everything else vim can not find: llvm/clangd/ctags and so on

### For Vim(version >= 8.19)
1. 把 ~/.config/nvim/init.vim 替换为 ~/.vimrc  
2. 把配置中的 .config/nvim 替换为 .vim
