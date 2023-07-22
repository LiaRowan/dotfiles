### Path ###
set -x -g PATH $PATH /usr/local/share
set -x -g PATH $PATH $HOME/.local/bin
set -x -g PATH $PATH $HOME/.cargo/bin

### Environment ###
set -x -g SHELL (type -P fish)
set -x -g EDITOR nvim
set -x -g TERM xterm-256color

### Aliases ###
# Use Nvim if Exists
if type -P nvim > /dev/null 2>&1
  alias vim "nvim"
end

# Shortcuts
alias nodenom 'find ./ -name "node_modules" -type d -prune -exec rm -rf \'{}\' +'
abbr dotfiles 'cd ~/.dotfiles'
abbr l 'ls -lh'
abbr la 'ls -lah'
abbr ta 'tmux attach'

# Git
abbr gc "git clone"
abbr gs "git status"
abbr gd "git diff"
abbr ga "git add"
abbr gap "git add . -p"
abbr gi "git commit"
abbr gh "git log --pretty --graph --date short --oneline --color=always | less -r"
abbr ggo "git checkout"
abbr gb "git branch"
abbr gpom "git push origin master"
abbr gprom 'git pull --rebase origin master'


### Initialization ###
if [ ! $DISPLAY ]; and [ $XDG_VTNR -eq 1 ];
  # Add language support
  set -x -g GTK_IM_MODULE ibus
  set -x -g XMODIFIERS @im=ibus
  set -x -g QT_IM_MODULE ibus

  # Start ssh-agent
  set ENV_VARS ( \
      ssh-agent -s | \
      grep SSH | \
      awk '-F;' '{ print $1 }' | \
      awk -F= '{ print "set -x -g " $1 " " $2 ";" }' \
  )
  eval $ENV_VARS

  # Start Window Manager
  exec startx
end

