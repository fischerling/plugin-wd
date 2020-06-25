![][license-badge]

<div align="center">
  <a href="http://github.com/oh-my-fish/oh-my-fish">
  <img width=90px  src="https://cloud.githubusercontent.com/assets/8317250/8510172/f006f0a4-230f-11e5-98b6-5c2e3c87088f.png">
  </a>
</div>
<br>

# wd

Fast directory navigation plugin for [fish shell][fish].

wd (warp directory) lets you quickly navigate through your filesystem 
with custom directory shortcuts so called warp points.
Warping to a path pushes the path on the directory stack.
Navigation back can be achieved with either "popd" or "wd ..".

## Requirements

+ fish v2.3
+ cat
+ sed

## Install

With [Oh My Fish][omf-link]:

```fish
$ omf install wd
```

With [fisherman][fisherman]:

```fish
$ fisher add fischerling/plugin-wd
```

## Usage
```fish
$ wd [option] <warp point>
$ wd [option] <warp point>/some/path/
$ wd [option] [command] [warp point]
```

## Commands

```fish
..              Pop the last directory from the directory stack
add <point>     Adds the current working directory to your warp points
add! <point>    Overwrites existing warp point
rm <point>      Removes the given warp point
show            Print warp points to current directory
show <point>    Print path to given warp point
list            Print all stored warp points
warppoints      Print names of all stored warp points
warppoints-file Print path where the warppoints are stored
ls <point>      Show files from given warp point
path <point>    Show the path to given warp point
clean           Remove warp points to nonexistent directories
clean!          Same as clean without confirmation

-v | --version  Print version
-c | --config   Specify and set config file
-q | --quiet    Suppress all output
-f | --force    Equivalent to '!' with add and clean

help Shows the help text
```

## Default warpfile location

If wd hasn't already found a warpfile and stored its path in the universal fish variable `__wd_warprc` it will
search at those locations in the following order:

1. $WARP_FILE (environment variable)
2. $xdg_data_dir/wd/warppoints (for xdg_data_dir in $XDG_DATA_DIRS)
3. $XDG_DATA_HOME/wd/warppoints
4. $HOME/.local/share/wd/warppoints
5. $HOME/.warprc (deprecated)

If it can find a warppoint file it will silently create a new one in 3. or 4. according to the XDG Base Directory standard.

# License

[MIT][mit] © [fischerling][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/fischerling
[contributors]:   https://github.com/fischerling/plugin-wd/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[fisherman]:      https://github.com/fisherman/fisherman
[fish]:           http://fishshell.com/

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
