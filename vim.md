# nvim (neovim)

<!--toc:start-->
- [nvim (neovim)](#nvim-neovim)
  - [movement quick list](#movement-quick-list)
  - [modes (what the workflow looks like)](#modes-what-the-workflow-looks-like)
  - [macros](#macros)
<!--toc:end-->


## movement quick list

| **Action**                                                | **Input**         |
| :-------------------------------------------------------- | :---------------- |
| move one character (right, down, up, left)                | `h,j,k,l`         |
| move to start of next word                                | `w`               |
| move to start of last word                                | `b`               |
| move to end of next word                                  | `e`               |
| move to start of next word (by whitespace)                | `W`               |
| move to start of last word (by whitespace)                | `B`               |
| move to end of next word (by whitespace)                  | `E`               |
|-----------------------------------------------------------|-------------------|
| insert mode before cursor                                 | `i`               |
| insert mode after cursor                                  | `a`               |
| insert mode at start of line                              | `I`               |
| insert mode at end of line                                | `A`               |
|-----------------------------------------------------------|-------------------|
| visual mode                                               | `v`               |
| visual line mode                                          | `V`               |
| visual block mode                                         | `C-v`             |
|-----------------------------------------------------------|-------------------|
| scroll half a page up                                     | `C-u`             |
| scroll half a page down                                   | `C-d`             |
| scroll current line to center                             | `z z` / `z Enter` |
| scroll current line to top                                | `z t`             |
| scroll current line to bottom                             | `z b`             |
|-----------------------------------------------------------|-------------------|
| go one jump back                                          | `C-o`             |
| go one jump forward                                       | `C-i`             |
| jump to line `<n>`                                        | `<n> G`           |
| jump to previous blank line                               | `{`               |
| jump to next blank line                                   | `}`               |
| jump to start of block (scope)                            | `[ {`             |
| jump to end of block (scope)                              | `] }`             |
| jump to start of section (class, etc.)                    | `[ [`             |
| jump to end of section (class, etc.)                      | `] ]`             |
| jump to matching delimiter (e.g. parenthesis)             | `%`               |
|-----------------------------------------------------------|-------------------|
| increase number under cursor / in selection               | `C-a`             |
| decrease number under cursor / in selection               | `C-x`             |
| incrementally increase number under cursor / in selection | `g C-a`           |
| incrementally decrease number under cursor / in selection | `g C-x`           |

- ..
- jump word (with and without selection)
- move (half a) page up/down
- home/end (behind last character)
- delete/cut/copy/paste (move)


## modes (what the workflow looks like)

TODO..


## macros

Vim macros are a recorded sequence of commands one can replay.

Start recording with `q` followed by the key which the macro should be stored under, e.g. `a`.
Type your commands and end the recording with `q`.
Use the macro with `@a`.

Example: `q`, `a`, `f`, `.`, `a`, `Enter`, `Esc`, `q` records a macro under `a` which searches for the next full stop and inserts a newline after.

