# .dotfiles

This repo holds all my dotfiles.

## Usage

You can select which dotfiles should be applied by using the following command in the root of the `.dotfiles/` directory:

```
bash setup.sh
```

By default, the `.config/` and `.dotfiles/` directories are expected to be in the user profile directory. In other words, the default config and dotfiles directories are `~/.config/` and `~/.dotfiles/` respectively. If this is not the case for you use the first two arguments of the `setup.sh` bash script to set the correct config and dotfiles directories.

```
bash setup.sh <config_dir> <dotfiles_dir>
```
