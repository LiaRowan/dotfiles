#!/usr/bin/env bash

DF=~/.dotfiles

mkdir -p ~/.local/bin
mkdir -p ~/.config/ranger

ln -s $DF/tmux/tmux.conf ~/.tmux.conf
ln -s $DF/vim ~/.vim
ln -s $DF/vim/vimrc ~/.vimrc
ln -s $DF/fish ~/.config/fish
ln -s $DF/vim ~/.config/nvim
ln -s $DF/vim/vimrc ~/.config/nvim/init.vim
ln -s $DF/ranger/rc.conf ~/.config/ranger/rc.conf

sudo apt install vim tmux fish nodejs wget fuse
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x ./nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
vim +PlugClean +PlugInstall +UpdateRemotePlugins +qall
git config --global core.editor nvim
