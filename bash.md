# bash

- [bash](#bash)
  - [shortcuts](#shortcuts)
    - [list of shortcuts](#list-of-shortcuts)
    - [unbind shortcuts](#unbind-shortcuts)
  - [tips and tricks](#tips-and-tricks)
    - [multitarget paths](#multitarget-paths)

## shortcuts
### list of shortcuts
| Shortcut   | Action |
| :--------- | :----- |
| ctrl+a     | go to the start of the line |
| ctrl+e     | go to the end of the line |
| ctrl+b     | move one character backwards |
| ctrl+f     | move one character forwards |
| alt+b      | move one word backwards |
| alt+f      | move one word forwards |
| **ctrl+w** | **delete to last white space** |
| alt+?      | show completion options |
| **ctrl+r** | **search command history backwards** |
| ctrl+g     | exit history search |
| ctrl+p     | previous command in history |
| ctrl+n     | next command in history |
| ctrl+o     | run command and re-enter it |
| ctrl+l     | clear screen |
| ctrl+s     | suppress output to screen |
| ctrl+q     | resume output to screen |
| ctrl+c     | terminate command |
| ctrl+z     | suspend current command (resume with `fg`) |
| crtl+u     | delete to start of line |
| ctrl+k     | delete to end of line |
| **ctrl+d** | **exit shell** |

### unbind shortcuts
bash shortcuts can be disabled with the following command in `.bashrc`/`.bash_profile`:
```bash
bind -r "<shortcut-to-unbind>"
```
Example:
```bash
bind -r "\C-h"
```
`\C` is CTRL, `\M` is ALT

## tips and tricks

### multitarget paths

Bash allows for variable expansion in paths. This can be useful, for example when copying multiple files from a directory. Instead of typing out the path multiple times, one can use '{<>,<>}' to specify multiple targets:
```bash
# without multitarget expansion
cp foo/bar/moo.wav foo/bar/bark.wav foo/

# with multitarget expansion
cp foo/bar/{moo.wav,bark.wav} foo/

# or even
cp foo/bar/{moo,bark}.wav foo/
```
Multitarget expansion also works in the middle of a path as seen in the third command example above.
> Use only ',' to separate targets and **no whitespace** as that would make a new argument.
> The expansion makes a new argument for each entry inside the braces, so **copy to several targets does not work.**
