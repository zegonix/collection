# GNU debugger

<!--toc:start-->
- [GNU debugger](#gnu-debugger)
  - [cheat sheet (nonexhaustive)](#cheat-sheet-nonexhaustive)
  - [reset program](#reset-program)
  - [TUI mode](#tui-mode)
    - [TUI keybindings](#tui-keybindings)
    - [navigation](#navigation)
    - [layouts](#layouts)
    - [source code view](#source-code-view)
<!--toc:end-->


## cheat sheet (nonexhaustive)

> commands can be shortened
>
> e.g.: `b` for `breakpoint`

| **command**           | **description**                                   |
|:----------------------|:--------------------------------------------------|
| `continue`            | continue normal execution                         |
| `break <pos|exp>`     | set breakpoint                                    |
| `info breakpoint`     | list breakpoints                                  |
| `delete <#breakpoint>`| delete breakpoint                                 |
| `step`                | execute next instruction, then halt (step in)     |
| `next`                | execute next instruction (step over)              |
| `finish`              | execute until the end of the current function (step out) |
|                       |                                                   |
| `backtrace`           | show call stack                                   |
| `print[/fmt] exp`     | show content of variable/memory location/register |
| `display[/fmt] exp`   | print variable/memory on every program stop       |
| `x[/fmt] address`     | print memory content at address                   |
| `list <pos>`          | show file/lines/symbol in source code window      |
|                       |                                                   |
| `tui disable`         | disable tui                                       |
| `tui enable`          | enable tui                                        |
| `layout <layout>`     | select specified layout                           |
| `layout next/prev`    | choose next or previous layout                    |
| `focus <window>`      | focus specified window                            |


### position specifier

| **position**          | **description**                                   |
|:----------------------|:--------------------------------------------------|
| `<symbol-name>`       | name of a symbol, e.g. function name              |
| `<line>`              | line number (in current file)                     |
| `<file>:<line>`       | line number in the specified file                 |


### format specifier

`fmt = <count><format><unit>`

| **symbol** | **category** | **description**         |
|:-----------|:------------:|:------------------------|
| `d`        | format       | decimal                 |
| `x`        | format       | hexadecimal             |
| `o`        | format       | octal                   |
| `u`        | format       | unsigned decimal        |
| `t`        | format       | binary                  |
| `f`        | format       | float                   |
| `a`        | format       | address                 |
| `i`        | format       | instruction             |
| `c`        | format       | character               |
| `s`        | format       | string                  |
| `z`        | format       | hexadecimal zero padded |
|            |              |                         |
| `b`        | unit         | byte                    |
| `h`        | unit         | halfword (2 bytes)      |
| `w`        | unit         | word (4 bytes)          |
| `g`        | unit         | giant (8 bytes)         |


### notes on expressions (breakpoint/display/print)

In Assembly one can use `$<reg>` to target the value of a register.
To get the value of a variable or constant, use `&<symbol>`.

In higher level languages like C, prefixing a symbol with `&` get its address.
Local symbols are only valid in their scope and may not exist at all when
compiled with optimisations.


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
