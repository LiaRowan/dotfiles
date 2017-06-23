# Export PATH
set -x GOPATH "$HOME/projects/gocode"
set -x PATH $PATH $GOPATH/bin


### Aliases ###
# Use Nvim if Exists
if which nvim > /dev/null ^ /dev/null
  alias vim "nvim"
end

# Shortcuts
alias proj 'cd ~/projects'
alias todo 'vim ~/.dotfiles/.todos.md'
abbr l 'ls -la'

# Git
abbr gc "git clone"
abbr gs "git status"
abbr gd "git diff"
abbr ga "git add"
abbr gi "git commit"
abbr gh "git log --pretty --graph --date short --oneline --color=always | less -r"
abbr ggo "git checkout"
abbr gb "git branch"
abbr gpom "git push origin master"
abbr gprom 'git pull --rebase origin master'

