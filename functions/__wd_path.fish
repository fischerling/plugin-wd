function __wd_path
    set path (string split -m1 "/" $argv[1])
    for l in (__wd_read_warprc)
        if string match "$path[1]:*" $l >/dev/null
            if test (count $path) -eq 2
                echo (string split : $l)[2]"/$path[2]"
            else
                echo (string split : $l)[2]
            end
        end
    end
end
