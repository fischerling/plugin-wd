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

## Install

With [Oh My Fish][omf-link]:

```fish
$ omf install wd
```

With [fisherman][fisherman]:

```fish
$ fisher https://github.com/fischerling/plugin-wd
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
ls <point>      Show files from given warp point
path <point>    Show the path to given warp point
clean           Remove warp points to nonexistent directories
clean!          Same as clean without confirmation

-v | --version  Print version
-c | --config   Specify and set config file (default ~/.warprc)
-q | --quiet    Suppress all output
-f | --force    Equivalent to '!' with add and clean

help Shows the help text
```

# License

[MIT][mit] © [fischerling][author] et [al][contributors]


[mit]:            http://opensource.org/licenses/MIT
[author]:         http://github.com/fischerling
[contributors]:   https://github.com/fischerling/plugin-wd/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[fisherman]:      https://github.com/fisherman/fisherman
[fish]:           http://fishshell.com/

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
