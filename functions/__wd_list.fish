function __wd_list
    __wd_print_msg "blue" "All warp points:"
    for l in (__wd_read_warprc)
        __wd_print_msg "normal" (printf "%20s  ->  %s" (string split ':' $l))
    end
end
