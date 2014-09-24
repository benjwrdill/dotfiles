all: .zshrc .vimrc .tmux.conf
	rm ~/.vimrc
	rm ~/.zshrc
	rm ~/.tmux.conf
	ln -s ~/dotfiles/.vimrc ~/
	ln -s ~/dotfiles/.zshrc ~/
	ln -s ~/dotfiles/.tmux.conf ~/

new: .zshrc .vimrc .tmux.conf
	ln -s ~/dotfiles/.vimrc ~/
	ln -s ~/dotfiles/.zshrc ~/
	ln -s ~/dotfiles/.tmux.conf ~/
