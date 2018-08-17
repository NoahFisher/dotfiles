Create symlinks between dotfiles and vimfiles, install Vundle, install fzf.
```
git clone https://github.com/NoahFisher/dotfiles.git
cd ~
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/vim .vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
