#!/bin/bash
# Installs
if [[ "$OSTYPE" == "darwin"* ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install neovim/neovim/neovim
  brew install git zsh netcat sshuttle
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	gem install bropages
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

mv ~/.oh-my-zsh ~/.omzsh-pre-install
mv ~/.zshrc ~/.zshrc-pre-install

git clone --recursive https://github.com/tmccleve/dotfiles.git ~/.dotfile
git clone https://github.com/pyenv/pyenv.git ~/.pyenv


# Symlinks
ln -s ~/.dotfile/config ~/.config
ln -s ~/.dotfile/nvim ~/.nvim
ln -s ~/.dotfile/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfile/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfile/vim/vimrc ~/.vimrc
ln -s ~/.dotfile/zsh/.zprezto/runcoms/zlogin ~/.zlogin
ln -s ~/.dotfile/zsh/.zprezto/runcoms/zlogout ~/.zlogout
ln -s ~/.dotfile/zsh/.zprezto ~/.zprezto
ln -s ~/.dotfile/zsh/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -s ~/.dotfile/zsh/.zprezto/runcoms/zprofile ~/.zprofile
ln -s ~/.dotfile/zsh/.zprezto/runcoms/zshenv ~/.zenv
ln -s ~/.dotfile/zsh ~/.zsh
ln -s ~/.dotfile/zsh/zshrc ~/.zshrc
ln -s ~/.dotfile/vim ~/.vim
ln -s ~/.dotfile/vim/vimrc ~/.config/vim/init.vim
ln -s ~/.dotfile/vim/vimrc ~/.config/nvim/init.vim

chsh -s /bin/zsh
