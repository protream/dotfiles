install: vim zsh snip

vim:
	rm ~/.vimrc
	ln -s `pwd`/vimrc ~/.vimrc

zsh:
	rm ~/.zshrc
	ln -s `pwd`/zshrc ~/.zshrc

snip:
	ln -s `pwd`/UltiSnips ~/.vim/UltiSnips
