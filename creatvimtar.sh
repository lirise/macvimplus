#!/bin/bash
# Author: lirise(alfangj@126.com)
# Create Time: 2021-02-23 21:27:09
# Modified Time: 2021-02-23 22:20:56 

rm -rf $HOME/.vim/plugged/tabnine-vim
rm -rf $HOME/macvimplus/vim.tar.gz

cd $HOME/

tar -czf vim.tar.gz .vim

mv vim.tar.gz $HOME/macvimplus/

exit 0

