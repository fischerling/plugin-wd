function __wd_warp
    if test $argv[1] = ".."
        popd
    else
        set path (__wd_path $argv[1])
        if test -z "$path"
            __wd_exit_nopoint $argv[1]
        else
            pushd $path
        end
    end
end
