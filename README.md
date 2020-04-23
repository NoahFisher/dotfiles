Highlights
=========
`fzf` for fuzzy searching
`ripgrep` for searching

# Create symlinks between dotfiles and vimfiles, install Vundle, install fzf.
```
git clone https://github.com/NoahFisher/dotfiles.git
cd ~
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/vim .vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# Install git branch autocomplete script
```
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
```

Some things to get tmux and macosx working nicely together:
http://blog.firstiwaslike.com/working-with-the-macos-system-clipboard-in-vim-inside-tmux/

Tmux
=========
```
leader: ctrl space
split pane into new window: <leader> !
join pane: <leader> :join-pane -v 2
join pane horizontally: <leader> :join-pane -t 2
```

Set the default directory inside of a session
```
Ctrl+space :

attach -c /Users/noah/...
```

Vim
=========

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

Setup git hooks using the `hook` directory. To get ctags to index all gems...
```bash
# https://github.com/tpope/gem-ctags
$ gem install gem-ctags
$ gem ctags
```

