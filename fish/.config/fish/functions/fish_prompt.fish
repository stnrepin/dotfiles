function fish_prompt --description 'Write out the prompt'
    set -g lstatus $status

    set -l suffix 'ᐳ'
    set -l color_cwd blue
    set -l pwd (prompt_pwd --full-length-dirs 5)

    set -l color_suf normal
    if not test $lstatus -eq 0
        set color_suf red
    end

    echo ''
    echo -s (set_color $color_cwd) $pwd (set_color normal)
    echo -ns (set_color $color_suf) $suffix (set_color normal) ' '
end

function fish_right_prompt -d 'Write out the right prompt'
end
