mkfile := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_path := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
tmux_path = ~/.tmux.conf

refresh: .zshrc .vimrc .tmux.conf
ifneq (,$(wildcard $(tmux_path)))
	rm ~/.vimrc
	rm ~/.zshrc
	rm ~/.tmux.conf
endif
	ln -s $(mkfile_path).vimrc ~/
	ln -s $(mkfile_path).zshrc ~/
	ln -s $(mkfile_path).tmux.conf ~/

new: zsh vim tmux notes

vim: colors vim-plugins .vimrc
	apt-get install vim
	ln -s $(mkfile_path)/.vimrc $(mkfile_path)/..

vim-plugins:
	mkdir -p $(mkfile_path)/../vim/autoload $(mkfile_path)/../vim/bundle && \
	curl -LSso $(mkfile_path)/../vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	git clone https\://github.com/reedes/vim-wordy $(mkfile_path)/../vim/bundle/vim-wordy

tmux:
	ln -s $(mkfile_path)/.tmux.conf $(mkfile_path)/../

zsh:
	sudo apt-get install zsh
	ln -s ~/dotfiles/.zshrc $(mkfile_path)/../
	sh -c "$$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

notes:
	sudo ln -s $(shell pwd)/bin/note.sh /usr/bin/note
	mkdir ~/notes

colors:
	mkdir ~/.vim
	mkdir ~/.vim/colors
	wget -O ~/.vim/colors/jellybeans.vim https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim	
