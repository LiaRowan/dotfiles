# Jak Rowan's Dotfiles

These are my personal dotfiles. Feel free to have a look and grab anything you like. I try to keep it pretty well commented.

## Installation

To install:

```
git clone https://github.com/jakrazzi/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install
```

This will symlink all config files and install useful tools and plugins. Dotbot apparently has some issues with Ubuntu, so you
will need to manually run the following commands:

```
chsh -s /usr/bin/fish
ln ~/.config/fish/fishd.Hostname ~/.config/fish/fishd.$HOSTNAME
```

This will set fish as your default shell and symlink the fish preferences file to the proper location.

Finally, just open a new shell session to use fish as your default shell, or you can run

```
fish
```

to temporarily switch to the fish shell.


## Other Installed Tools

- Git
- Neovim
- Tmux
- Fish

