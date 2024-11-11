# Linux commands

- [Linux commands](#linux-commands)
  - [combine commands with *xargs*](#combine-commands-with-xargs)

## combine commands with *xargs*

Some commands (e.g. `chmod`) can't handle input via pipe and require the input as arguments. `xargs` takes the standard input as list of arguments seperated by spaces or newlines and executes the given command with the input parsed to a list of arguments.

Usage:
```bash
find . -type f | xargs chmod 644
```
