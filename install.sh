#!/bin/bash

# This script assumes that the current working directory is ~/.vim

path="$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")"
dir=`dirname $path`

if [ -e "$HOME/.vimrc" ] ; then
  echo "There is already a ~/.vimrc file"
  exit
fi

if [ "$dir" != "$HOME/.vim" ] ; then
  echo "The current working directory is not ~/.vim"
  if [ -e "$HOME/.vimrc" ] ; then
    echo "And there is already a ~/.vim directory"
    exit
  fi
  echo "Linking $dir to ~/.vim"
  ln -s $dir ~/.vim
fi

echo "Linking $dir/vimrc to ~/.vimrc"
ln -s $dir/vimrc ~/.vimrc

echo "Installing vundle"
cd $dir
git submodule init
git submodule update

echo "Installing vundle bundles"
vim +BundleInstall +qall

echo "Done."

