# Jak Rowan's Dotfiles

These are my personal dotfiles. Feel free to have a look and grab anything you like. I try to keep it pretty well commented.

## Installation

To install:

```
git clone https://github.com/jakrazzi/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install
```

This will symlink all files and promt you for your password in order to change your default shell to zsh. If you don't want your default shell changed, you can ctr+c at this time, and it won't affect the rest of the installation.

Alternatively, you can go into `install.conf.yaml` and remove `- chsh -s /bin/zsh` from the `- shell:` dictionary.

Finally, run:

```
vim +PlugInstall +qall
```

This will install all of vim's plugins and auto-quit.

## Other Tools

Tmux:

```
brew install tmux
```

Neovim:

```
brew install neovim/neovim/neovim
```

