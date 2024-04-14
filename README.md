# .dotfiles

This repo holds all my dotfiles. >.<

# Usage

## All dotfiles

This is for when you want to add all directories to your ".config". This is
usually used for when you haven't set anything up yet.

Run this in the ".dotfiles" directory:

`sh setup.sh`

## Single dotfile

Run this in the ".dotfiles" directory:

`ln -s ~/.dotfiles/<dir>/ ~/.config/`

Where `<dir>` is replaced by the directory name of the config you want to add to
your machine.

>**NOTE:** Some dotfiles need multiple commands to work as intended. Check the
"setup.sh" file to make sure no extra commands are necessary.
