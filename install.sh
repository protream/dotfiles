#!/bin/bash

if [ -d "$HOME/.vim/bundle" ]; then
    echo "Vundle already exist!"
else
    echo "Install Vundle ..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Install vimrc ..."
if [ -f "$HOME/.vimrc" ]; then
	rm ~/.vimrc
fi
ln -s `pwd`/vimrc ~/.vimrc

echo "Install zshrc ..."
if [ -f "$HOME/.zshrc" ]; then
    rm ~/.zshrc
fi
ln -s `pwd`/zshrc ~/.zshrc

echo "Install custom snippets ..."
if [ -d "$HOME/.vim/UltiSnips" ]; then
    rm -rf ~/.vim/UltiSnips
fi
ln -s `pwd`/UltiSnips ~/.vim/UltiSnips

echo "Done!!!"



