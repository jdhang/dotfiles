#!/bin/bash
echo 'Symlinking dotfiles'

# bash settings
ln -s ~/.dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash/.bashrc ~/.bashrc

ln -s ~/.dotfiles/.editor_config ~/.editor_config

# get settings
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/gitmessage ~/.gitmessage
ln -s ~/.dotfiles/git_template ~/.git_template

ln -s ~/.dotfiles/tern-config ~/.tern-config

# tmux
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux-osx.conf ~/.tmux-osx.conf

# vim/neovim settings
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vim/init.vim
ln -s ~/.dotfiles/vim/colors ~/.vim/colors
ln -s ~/.dotfiles/vim/mappings.vim ~/.vim/mappings.vim
ln -s ~/.dotfiles/vim/plugins.vim ~/.vim/plugins.vim
ln -s ~/.dotfiles/vim/settings.vim ~/.vim/settings.vim
ln -s ~/.dotfiles/vim/settings ~/.vim/settings
ln -s ~/.dotfiles/vim/syntax ~/.vim/syntax
ln -s ~/.dotfiles/vim/syntaxes.vim ~/.vim/syntaxes.vim

