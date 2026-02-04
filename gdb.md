# GNU debugger

<!--toc:start-->
- [GNU debugger](#gnu-debugger)
<!--toc:end-->


## reset program

To reset the program one can use the following command

```sh
# reset program and halt execution
monitor reset halt
```

## TUI mode

The `GDB` comes with a Terminal User Interface (TUI) which provides view for
the assembly, the registers and the source code.

One can enable the TUI with `tui enable` or disable with `tui disable`.

```sh
# enable/disable TUI
tui enable
tui disable
```

### TUI keybindings

| **Keybinding** | **Action**             |
|:---------------|:-----------------------|
| `C-x,a/A/C-a`  | toggle TUI mode on/off |
| `C-o`          | focus next window      |


### navigation

One can navigate using the [keybindings](#tui-keybindings), but the easiest
method is to use the `focus` command.
The `cmd` window is the only one that accepts alphanumeric input, so regardless
of the focused window, one can always use `focus <window>` to focus a specific
window.


### layouts

One can choose various layouts with the following command:

```gdb
# choose layout, enable views
layout <layout-name>
# default layout options:
# * asm
# * regs
# * src
# * split
```

The `tui` command also allows to define custom layouts.
See the example below.

```gdb
# defines a layout with the name `test` and the view `regs`, `src` and `cmd`
tui new-layout test {-horizontal regs 1 src 2} 1 cmd 1

# synopsis of `tui new-layout`
tui new-layout <name>  <view> <weight> [<view> <weight>]
tui new-layout <name> {[-horizontal] <view> <weight> [<view> <weight>]} <weight>
```


### source code view

The source code view - as the name suggests - displays source code.
By default the window displays the file containing the current instruction,
but one can choose a differnt file with the `list` command.
Below are several examples of how to use this command.

```gdb
# when specifying a file, a line number is required
list <file-name>:<line-number>

# list knows symbol names
list <symbol>
list main # this will show the main function

# show current execution point
list .
```
