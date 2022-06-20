### PATH ###
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin

### Aliases ###
# Use Nvim if Exists
if which nvim &> /dev/null
  alias vim 'nvim'
end

### Shortcuts ###
alias journal 'vim ~/Documents/Notebook/index.wiki'
alias nodenom 'find ./ -name "node_modules" -type d -prune -exec rm -rf \'{}\' +'
abbr dotfiles 'cd ~/.dotfiles'
abbr l 'ls -lh'
abbr la 'ls -lah'
abbr cl 'clear'

### Git ###
abbr gc 'git clone'
abbr gs 'git status'
abbr gd 'git diff'
abbr ga 'git add'
abbr gap 'git add . -p'
abbr gi 'git commit'
abbr gh 'git log --pretty --graph --date short --oneline --color=always | less -r'
abbr ggo 'git checkout'
abbr gb 'git branch'
abbr gpom 'git push origin master'
abbr gprom 'git pull --rebase origin master'

### Node ###
abbr ni 'npm install'
abbr ns 'npm start'
abbr nt 'npm test'
