refresh: .zshrc .vimrc .tmux.conf
	rm ~/.vimrc
	rm ~/.zshrc
	rm ~/.tmux.conf
	ln -s ~/dotfiles/.vimrc ~/
	ln -s ~/dotfiles/.zshrc ~/
	ln -s ~/dotfiles/.tmux.conf ~/

new: zsh vim tmux

vim: colors vim-plugins .vimrc
	apt-get install vim
	ln -s ~/dotfiles/.vimrc ~/

vim-plugins:

tmux:
	apt-get install -y python-software-properties software-properties-common
	add-apt-repository -y ppa:pi-rho/dev
	apt-get update
	apt-get install -y tmux=2.0-1~ppa1~t
	ln -s ~/dotfiles/.tmux.conf ~/

zsh:
	apt-get install zsh
	ln -s ~/dotfiles/.zshrc ~/
	sh -c "$$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


colors:
	mkdir ~/.vim
	mkdir ~/.vim/colors
	wget -O ~/.vim/colors/jellybeans.vim https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim	
