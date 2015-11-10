function __wd_add
    if string match -r "^(\.)+\$" $argv[2] >/dev/null
        __wd_exit_fail "Warp point cannot be just dots"
    else if string match "* *" $argv[2] >/dev/null
        __wd_exit_fail "Warp point should not contain whitespace"
    else if string match "*:*" $argv[2] >/dev/null
        __wd_exit_fail "Warp point cannot contain colons"
    else if test -z "$argv[2]"
        __wd_exit_fail "Warp point cannot be empty"
    else
        set path (__wd_path $argv[2])
        if test -n "$path"
            if test "$argv[1]" = "true"
                __wd_remove $argv[2] >/dev/null
            else
                __wd_exit_fail "Warp point $argv[2] already exists. Use add! or -f to overwrite."
                return
            end
        end
        echo "$argv[2]:$PWD" >> $__wd_warprc
        __wd_print_msg "green" "Warp point $argv[2] added"
    end
end
