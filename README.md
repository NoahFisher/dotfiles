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

vim tips:

To edit a macro:
- "qp paste the contents of the register to the current cursor position
- I enter insert mode at the begging of the pasted line
- ^ add the missing motion to return to the front of the line
- <Escape> return to visual mode
- "qyy yank this new modified macro back into the q register
- dd delete the pasted register from the file your editing


mysql pager (behaves like less in psql)
```
\P less -SinFX
```
