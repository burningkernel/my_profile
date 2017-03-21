#########################################################################
# File Name: install.sh
# Author: fatmouse
# mail: burningkernel@icloud.com
# Created Time: Tue Mar 21 10:32:04 2017
#########################################################################
#!/bin/bash
cp -r ./vim ~/.vim
cp ./vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
