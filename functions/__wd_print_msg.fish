function __wd_print_msg -d "prints a message with the color given in argv[1]"
    if set -q quiet
        return
    end
    set_color $argv[1]
    echo $argv[2]
    set_color "normal"
end
