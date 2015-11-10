function __wd_clean
    for l in (__wd_read_warprc)
        if not test -d (string split ":" $l)[2]
            set broken_entries $broken_entries $l
            echo -n (__wd_print_msg "yellow" "Nonexistent directory:")
            __wd_print_msg "normal" (string replace ":" " ->  " $l)
        end
    end
    set n (count $broken_entries)
    if test $n -eq 0
        __wd_print_msg "blue" "No warp points to clean, carry on!"
    else
        if test $argv[1] != "true"
            while true
                read -p "echo -n 'Removing $n warp points. Continue? (Y/n) '" answer
                switch $answer
                    case Y y YES yes Yes ""
                        set answer "yes"
                        break
                    case N n NO no No
                        set answer "no"
                        break
                    case "*"
                        echo "Please provide a valid answer (y or n)"
                end
            end
            if test "$answer" = "no"
                __wd_print_msg "yellow" "Cleanup aborted"
                return
            end
        end
        for entry in $broken_entries
            __wd_remove (string split ":" $entry)[1] >/dev/null
        end
        __wd_print_msg "green" "Clenup complete. $n warp point(s) removed"
    end
end
