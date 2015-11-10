function __wd_path
    for l in (__wd_read_warprc)
        if string match "$argv[1]:*" $l >/dev/null
            echo (string split : $l)[2]
        end
    end
end
