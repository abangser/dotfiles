#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=./dotfiles
olddir=~/dotfiles_old

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $dir/*; do
    filename=$(basename $file)
    echo $filename
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$filename ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$filename ~/.$filename
done
