# bash

## shortcut list
| Shortcut   | Action |
| :--------- | :----- |
| ctrl+a     | go to the start of the line |
| ctrl+e     | go to the end of the line |
| ctrl+b     | move one character backwards |
| ctrl+f     | move one character forwards |
| alt+b      | move one word backwards |
| alt+f      | move one word forwards |
| **ctrl+w** | delete to last white space |
| alt+?      | show completion options |
| **ctrl+r** | search command history backwards |
| ctrl+g     | exit history search |
| ctrl+p     | previous command in history |
| ctrl+n     | next command in history |
| ctrl+o     | run command and re-enter it |
| ctrl+l     | clear screen |
| ctrl+s     | suppress output to screen |
| ctrl+q     | resume output to screen |
| ctrl+c     | terminate command |
| ctrl+z     | suspend current command (resume with `fg`) |
| **ctrl+d** | exit shell |

## unbind shortcuts
bash shortcuts can be disabled with the following command in `.bashrc`/`.bash_profile`:
```bash
bind -r "<shortcut-to-unbind>"
```
Example:
```bash
bind -r "\C-h"
```
`\C` is CTRL, `\M` is ALT
