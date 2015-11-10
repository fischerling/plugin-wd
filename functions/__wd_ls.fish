function __wd_ls
    set path (__wd_path $argv[1])
    if test -z "$path"
        __wd_exit_nopoint $argv[1]
    else
        ls $path
    end
end
