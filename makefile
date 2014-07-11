all: .zshrc .vimrc .tmux.conf
	rm ~/.vimrc
	rm ~/.zshrc
	rm ~/.tmux.conf
	ln -s ./.vimrc ~/.vimrc
	ln -s ./.zshrc ~/.zshrc
	ln -s ./.tmux.conf ~/.tmux.conf
