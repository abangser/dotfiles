#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

custom_dotfile_dir=$(pwd)/dotfiles
custom_zsh_dir=$(pwd)/custom_zsh
old_dotfile_dir=~/dotfiles_old
old_zsh_dir=~/custom_zsh_old
local_dotfile_dir=~/
local_zsh_dir=~/.oh-my-zsh/custom

##########

# create dotfiles_old in homedir
echo "Creating folders for backup of any existing files in ~"
mkdir -p $old_dotfile_dir
mkdir -p $old_zsh_dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $custom_dotfile_dir/*; do
    filename=$(basename $file)
    mv ~/.$filename ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $file $local_dotfile_dir/.$filename
done

# move any existing zsh custom files into the custom_zsh_old dir, then create symlinks
for file in $custom_zsh_dir/*.zsh; do
    filename=$(basename $file)
    mv $local_zsh_dir/$filename $old_zsh_dir
    echo "Creating symlink for $file in oh-my-zsh custom directory."
    ln -s $file $local_zsh_dir/$filename
done
