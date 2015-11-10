function __wd_show
    if test -n "$argv[1]"
        set path (__wd_path $argv[1])
        if test -n "$path"
            echo -n (__wd_print_msg "green" "Warp point:")
            __wd_print_msg "normal" "$argv[1] -> $path"
        else
            __wd_exit_nopoint $argv[1]
        end
    else
        for l in (__wd_read_warprc)
            if string match "*:$PWD" $l >/dev/null
                set matches $matches (string split ":" $l)[1]
            end
        end
        if test (count $matches) -ne 0
            echo -n (__wd_print_msg "blue" (count $matches))
            echo -n (__wd_print_msg "normal" "warp point(s) to current directory:")
            __wd_print_msg "blue" "$matches"
        else
            __wd_exit_fail "No warp points to $PWD"
        end
    end
end
