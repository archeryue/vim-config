## ln -s vim-config/vimrc ~/.vimrc
> vimrc 是从网上找了一份相对简单的版本，然后根据需求定制的  
> 原版是针对 Golang 做的配置，我加入了一些常用的 C/C++ 配置  
> 再根据习惯加了一些注释啊、跳转啊什么的  

## Install plug-vim
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

1. :PlugInstall
2. :GoInstallBinaries
3. install nodejs
4. cp coc-settings.json to ~/.vim/
5. cp go.snippets to ~/.vim/UltiSnips/  

## Install dependencies
- install everything else vim can not find: llvm/clangd/ctags and so on

### Vim version >= 8.19
