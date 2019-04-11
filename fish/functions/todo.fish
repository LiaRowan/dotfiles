function todo
  set file ~/.dotfiles/.todos/todos.md

  if test -n "$argv[1]"
    set file (echo ~/.dotfiles/.todos/"$argv[1]".md)
  end

  vim $file
end
