function fish_prompt --description 'Write out the prompt'
    # Colors
    set orange FF830F
    set yellow E8DB27
    set grey 949494
    set red EB221C

    # Save our status
    set -l last_status $status
    set -l last_status_color

    if [ $last_status -ne 0 ]
        set last_status_color $red
    else
        set last_status_color normal
    end

    echo -ns (set_color $yellow --bold) "$USER" @ (prompt_hostname) (set_color normal) ':'
    echo -ns (set_color $orange --bold) (prompt_pwd) (set_color normal)
    echo -ns (set_color $last_status_color) '$ ' (set_color normal)
end
