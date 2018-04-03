Create symlinks between dotfiles and vimfiles
```
git clone https://github.com/NoahFisher/dotfiles.git
cd ~
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/.vim .vim
```

to get fzf working, you need both of the following lines: 
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'