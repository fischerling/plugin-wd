function __wd_remove
    set path (__wd_path $argv[1])
    if test -n "$path"
        if sed -n "/^$argv[1]:.*\$/!p" $__wd_warprc > $__wd_warprc.tmp; and mv $__wd_warprc.tmp $__wd_warprc
            __wd_print_msg "green" "Warp point $argv[1] removed"
        else
            __wd_exit_fail "Unable to delete warp point!"
        end
    else
        __wd_exit_nopoint $argv[1]
    end
end
