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
# Git
alias gc "git clone"
alias gs "git status"
alias gd "git diff"
alias ga "git add"
alias gi "git commit"
alias gh "git log --pretty --graph --date short --oneline --color=always | less -r"
alias ggo "git checkout"
alias gb "git branch"
alias gpom "git push origin master"
alias gprom 'git pull --rebase origin master'

