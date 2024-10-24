# Lia Rowan's Dotfiles

These are my personal dotfiles. Feel free to have a look and grab anything you like. I try to keep
it pretty well commented.

The master branch is for `Arch Linux` installs. Other branches include installs for other operating
systems, currently `macOS` and `ubuntu`.

## Installation

To install:

```
sudo apt install git python3
git clone https://github.com/LiaRowan/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

This will symlink all config files and install useful tools and plugins. Then run the following
commands:

```
chsh -s /usr/bin/fish
ln ~/.config/fish/fishd.Hostname ~/.config/fish/fishd.$HOSTNAME
```

This will set fish as your default shell and symlink the fish preferences file to the proper
location.

Finally, just open a new shell session to use fish as your default shell, or you can run

```
fish
```

to temporarily switch to the fish shell.

## Other Installed Tools

- Neovim
- Tmux
- Fish
- Pip

## Recommended Tooling

Rust:
  - `rustup component add rustfmt`
  - `rustup component add rust-analysis rust-src`
  - `cargo install cargo-watch cargo-edit`
