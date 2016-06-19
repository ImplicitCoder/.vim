Vim Configuration directory
===========================

Note: The vimrc file is in the root of ~/.vim.

This will work for vim version 7.4

Otherwise, symlink:
```
ln -s  ~/.vimrc ~/.vim/vimrc 
```

To install onto a machine:
```
git clone https://github.com/debaze/.vim && git submodule update --init

In order for YouCompleteMe to work, one shoud recursively install dependencies:

```
git submodule update --init --recursive
```

The CMake should be installed
```
sudo apt-get -y install CMake
```
Finally, compile YCM semantic support:
```
cd ~/.vim/bundle/YouCompleteMe
./install.py
