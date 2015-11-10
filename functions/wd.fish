#!/usr/bin/fish

# WARP DIRECTORY
# ==============
# Jump to custom directories in terminal
# because `cd` takes too long...
#
# This script is heavily influenced by :
# @github.com/mfaerevaag/wd 
#
# And it is decined to be compatible with the original wd.
#
# author
# @github.com/fischerling

function wd --description 'warp directory'
	set __wd_version 0.8

     # set default warprc location
    if not set -q __wd_warprc
        set -U __wd_warprc "$HOME/.warprc"
    end

    # set exit status
    set -g __wd_exit_status 0

    # check if 'help' appears first -> don't parse $argv
    if begin test (count $argv) -eq 0
             or test $argv[1] = "help"
             end
        switch (count $argv)
        case 0 1
            __wd_help ""
            return
        case 2
            __wd_help $argv[2]
            return
        end
        __wd_print_msg "red" "help only takes one argument."
        return
    end


    #parse arguments
    set arguments
    for i in (seq 1 (count $argv))
        switch $argv[$i]
            case -v --version
                __wd_print_msg "normal" "wd version $__wd_version"
                set valid_single_option
            case -f --force
                set force "true"
            case -q --quiet
                set -g quiet
            case -c --config
                set config_set
                set valid_single_option
                if test -f $argv[(math $i+1)]
                    set -U __wd_warprc $argv[(math $i+1)]
                else
                    __wd_print_msg "yellow" "Ignoring -c $argv[$i] because it is not a valid file"
                end
            case '*'
                if set -q config_set
                    set -e config_set
                else
                    set arguments $arguments $argv[$i]
                end
        end
    end

    if test (count $arguments) -eq 0
        if not set -q valid_single_option
            __wd_help ""
        end
    else if test (count $arguments) -eq 1
        switch $arguments[1]
            case add
                __wd_exit_fail "You must enter a warp point"
            case add!
                __wd_exit_fail "You must enter a warp point"
            case rm
                __wd_exit_fail "You must enter a warp point"
            case show
                __wd_show
            case list
                __wd_list
            case ls
                __wd_exit_fail "You must enter a warp point"
            case path
                __wd_exit_fail "You must enter a warp point"
            case clean
                __wd_clean "false"
            case clean!
                __wd_clean "true"
            case '*'
                __wd_warp $arguments[1]
        end

    else if test (count $arguments) -eq 2
        switch $arguments[1]
            case add
                __wd_add "$force" $arguments[2]
            case add!
                __wd_add "true" $arguments[2]
            case rm
                __wd_remove $arguments[2]
            case show
                __wd_show $arguments[2]
            case list
                __wd_list
                __wd_exit_warn "Command takes no argument. Ignoring '$arguments[2]'"
            case ls
                __wd_ls $arguments[2]
            case path
                __wd_path $arguments[2]
            case clean
                __wd_clean "$force"
                __wd_exit_warn "Command takes no argument. Ignoring '$arguments[2]'"
            case clean!
                __wd_clean "true"
                __wd_exit_warn "Command takes no argument. Ignoring '$arguments[2]'"
            case '*'
                __wd_exit_fail "You can only warp to one point at once."
        end
    else
        __wd_exit_fail "No command uses 2 or more arguments."
    end

    #unset global variables
    if set -q quiet
        set -e quiet
    end

    # unset __wd_exit_status
    set es $__wd_exit_status
    set -e __wd_exit_status

    return $es
end
