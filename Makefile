install: vim snip ohmyzsh

vim:
		rm ~/.vimrc
		ln -s `pwd`/vimrc ~/.vimrc

snip:
		ln -s `pwd`/UltiSnips ~/.vim/UltiSnips

ohmyzsh:
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
		chsh -s /bin/zsh
		rm ~/.zshrc
		ln -s `pwd`/zshrc ~/.zshrc
