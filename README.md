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


Some things to get tmux and macosx working nicely together:
http://blog.firstiwaslike.com/working-with-the-macos-system-clipboard-in-vim-inside-tmux/


tmux tips:
```
leader: ctrl space
split pane into new window: <leader> !
join pane: <leader> :join-pane -v 2
join pane horizontally: <leader> :join-pane -t 2
```


mysql pager (behaves like less in psql)
```
\P less -SinFX
```
