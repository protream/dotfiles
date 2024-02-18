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

echo "Install agignore ..."
if [ -f "$HOME/.agignore" ]; then
	rm ~/.agignore
fi
ln -s `pwd`/agignore ~/.agignore

echo "Install tmuxrc ..."
if [-f "$HOME/.tmux.conf"]; then
    rm ~/.tmux.conf
fi
ln -s `pwd`/tmuxrc ~/.tmux.conf

if ! [ -f "$HOME/.vim/colors/solarized.vim" ]; then
    echo "Install `solarized.vim` theme ..."
    mkdir ~/.vim/colors
    ln -s `pwd`/solarized.vim ~/.vim/colors/solarized.vim
fi

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
