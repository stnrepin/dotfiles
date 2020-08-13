# My dotfiles

## Naming convention

The following folder naming convention is used:

* Folder without a prefix in the name used as [GNU
  Stow](https://www.gnu.org/software/stow/)'s package which contains
  corresponding application's configuration files

* Folder with `@` prefix contains machine-specific packages

* Folder with `^` prefix is Stow's package which contains user files

## Install

Clone the repository to any directory. Recommended directory is `~/.dotfiles`
(used further).

```sh
git clone https://github.com/stnrepin/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

Next, use GNU Stow to install a specific package:

```sh
stow nvim
stow @desktop1/xorg
```

This command will create directories and symlinks in `~` according to package
internal structure (see `.stowrc` file for Stow command line arguments).

## Remove

The following command removes a specific package files (not folders) from
`~/.config` (unfortunately, you have to manually delete folders and
files which is not managing by Stow)

```sh
stow -D nvim
```

