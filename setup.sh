#!/bin/sh

# Install oh my zsh if it doesn't exist
if [ ! -d  ~/.oh-my-zsh ]; then
	echo "Intalling oh-my-zsh"
	curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	./install.sh
else
	echo "oh-my-zsh already installed"
fi

# Install zsh auto suggest plugin for oh my zsh
if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
	echo "Installing zsh auto suggest"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	# Add zsh auto suggest configs
	python zsh_config.py

else
	echo "zsh auto suggest already installed"
fi 

# Copy vimrc_temp to vimrc
cp vimrc_temp ~/.vimrc
