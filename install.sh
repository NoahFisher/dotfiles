# Install script for Noah's dotfiles. To use, clone the dotfiles repo in the root folder of the
# current user. Then, run this script to install the Vim plugins and fzf (directory navigation).
# You may need to make this file excecutable (chmod +x install.sh)

# Assumes you've already done this:
# cd ~
# git clone https://github.com/NoahFisher/dotfiles.git

# make symbolic links to vim config and vim plugin directory
ln -s dotfiles/vimrc ~/.vimrc
ln -s dotfiles/vim ~/.vim
ln -s dotfiles/tmux.conf ~/.tmux.conf

# install the latest version of Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

