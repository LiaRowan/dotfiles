### Path ###
set -x -g PATH $PATH $HOME/.local/bin
set -x -g PATH $PATH (stack path | grep compiler-bin | cut -d ' ' -f 2)
set -x -g PATH $PATH (yarn global bin --offline)
set -x -g PATH $PATH $HOME/.cargo/bin

set -x -g EDITOR nvim

### Aliases ###
# Use Nvim if Exists
if which nvim > /dev/null ^ /dev/null
  alias vim "nvim"
end

# Shortcuts
abbr hub 'cd ~/path/to/hub/directory' # Change me
alias journal 'vim ~/Documents/Notebook/index.wiki'
alias nodenom 'find ./ -name "node_modules" -type d -prune -exec rm -rf \'{}\' +'
abbr dotfiles 'cd ~/.dotfiles'
abbr l 'ls -lh'
abbr la 'ls -lah'
abbr cl 'clear'

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

