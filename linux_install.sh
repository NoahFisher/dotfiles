# Install gh client
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# install rbenv
mkdir ~/.rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# -- add to ~/.bashrc
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
# test installation
# type rbenv # this should return a function

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -l
rbenv 2.5.1
rbenv global 2.5.0


eval "$(rbenv init -)"

# install exuberant ctags
sudo apt install exuberant-ctags
sudo apt install mosh


# Install NVM - instructions here
# https://github.com/nvm-sh/nvm

# Install yarn
# npm install -g yarn
