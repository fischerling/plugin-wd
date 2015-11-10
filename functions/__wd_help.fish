function __wd_help --argument command
    echo
    switch $command
        case ""
            echo "..              Pop the last directory from the directory stack"
            echo "add <point>     Adds the current working directory to your warp points"
            echo "add! <point>    Overwrites existing warp point"
            echo "rm <point>      Removes the given warp point"
            echo "show            Print warp points to current directory"
            echo "show <point>    Print path to given warp point"
            echo "list            Print all stored warp points"
            echo "ls <point>      Show files from given warp point"
            echo "path <point>    Show the path to given warp point"
            echo "clean           Remove warp points to nonexistent directories"
            echo "clean!          Same as clean without confirmation"
            echo
            echo "-v | --version  Print version"
            echo "-c | --config   Specify and set config file (default ~/.warprc)"
            echo "-q | --quiet    Suppress all output"
            echo "-f | --force    Equivalent to '!' with add and clean"
            echo
            echo "help [command]] Shows help abput specific command"

        case ".."
            echo "Pops the last directory from the directory stack"
            echo
            echo "Usage:"
            echo "      wd .."

        case "add"
            echo "Adds the current working directory to your warp points"
            echo
            echo "Usage:"
            echo "      wd add <point_name>"

        case "add!"
            echo "Overwrites existing warp point"
            echo
            echo "Usage:"
            echo "      wd add! <point_name>"

        case "rm"
            echo "Removes the given warp point"
            echo
            echo "Usage:"
            echo "      wd rm <point_name>"

        case "show"
            echo "1) Print warp points to current directory or"
            echo "2) Print path to given warp point"
            echo
            echo "Usage:"
            echo "1)      wd show"
            echo "2)      wd show <point_name>"


        case "list"
            echo "Print all stored warp points"
            echo
            echo "Usage:"
            echo "      wd list"


        case "ls"
            echo "Show files from given warp point"
            echo
            echo "Usage:"
            echo "      wd ls <point_name>"


        case "path"
            echo "Show the path to given warp point"
            echo
            echo "Usage:"
            echo "      wd path <point_name> "


        case "clean"
            echo "Remove warp points to nonexistent directories"
            echo
            echo "Usage:"
            echo "      wd clean" 


        case "clean!"
            echo "Same as clean without confirmation"
            echo
            echo "Usage:"
            echo "      wd clean!"

        case "-v" "--version"
            echo "Print version"
            echo
            echo "Usage:"
            echo "      wd -v [option] [command]"
            echo "      wd --version [option] [command]"
            echo "Output:"
            echo "      wd version <wd_version>"
            echo "      [output from command]"


        case "-c" "--config"
            echo "Specify and set config file (default ~/.warprc)"
            echo
            echo "Usage:"
            echo "      wd -c <path/to/config> [options] [command]"
            echo "      wd --config <path/to/config> [options] [command]"


        case "-q" "--quiet"
            echo "Suppress all output"
            echo
            echo "Usage:"
            echo "      wd -q [options] [command]"
            echo "      wd --quiet [options] [command]"


        case "-f" "--force"
            echo "Equivalent to '!' with add and clean"
            echo
            echo "Usage:"
            echo "      wd -f add <point> == wd add! <point>"
            echo "      wd -f clean == wd clean!"


        case "*"
            echo "no help available for $command"
            echo "please use wd help for an overview of all commands"
    end
end
