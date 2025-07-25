# git

This file contains tips and tricks to remember and documents some of my findings.


## Table of contents

<!--toc:start-->
- [git](#git)
  - [Table of contents](#table-of-contents)
  - [glossary](#glossary)
  - [branches](#branches)
    - [create a branch](#create-a-branch)
  - [submodules](#submodules)
  - [stash](#stash)
  - [fixup](#fixup)
  - [removing files from the index](#removing-files-from-the-index)
  - [philosophies](#philosophies)
    - [merge](#merge)
    - [rebase](#rebase)
  - [squash](#squash)
<!--toc:end-->


## glossary

| term | description |
| :--- | :---------- |
| head | pointer to branch (usually latest commit, unless detached=pointer to specific commit) currently checked out locally |
| index | keeps track of `staged/cached` (with git add) changes |
| working tree | local file working directory |
| `^` | one commit back (in history), use `<[HEAD|branch|commit_hash]>^` |
| `~<n>` | n commits back (in history), use `<[HEAD|branch|commit]~2` |


## branches

### create a branch

To create a branch use subcommand `branch` or `checkout` with flag `-b`:
```bash
# create new branch ('base-branch' is optional)
git branch <branch-name> <base-branch>
git checkout -b <branch-name> <base-branch>

# switch branch ('checkout -b' combines the 'branch' and 'switch' subcommands)
git switch <branch-name>
```


## submodules

To fetch submodules of a cloned repository use:
```sh
# do it manually
git submodule init
git submodule update

# do it all at once
git clone --recurse-submodules

# if repo is already cloned
git submodule update --init --recursive
```


### update reference

To update a parent repositories reference to a submodule `add` the modules path and commit:
```sh
git add <path/to/submodule>
git commit -m <commit-message>
```


## stash

If the current tree is dirty, one can use `git stash` to temporarily save the changes and reset the tree to the last commit.
Afterwards the changes can be reapplied with `git stash pop`.
This can be useful if for example one would like to create a new branch for the current changes.


## fixup

Use the argument `--fixup` with the subcommand `commit` to fix a commit.
Afterwards use `rebase --autosquash` to apply the fixup.

```sh
git add ...                           # Stage a fix
git commit --fixup=a0b1c2d3           # Perform the commit to fix broken a0b1c2d3
git rebase -i --autosquash a0b1c2d3~1 # Now merge fixup commit into broken commit
```

## removing files from the index

To remove files from the index without deleting them on disk, use:
```sh
git rm --cached <file-name>
```
This is helpful if one accidentally committed autogenerated files.


## philosophies

Important things to always remember:
**- do renaming in seperate commit**
**- don't merge conflicts with directories**


### merge

When following the philosophie of merging, one merges the target branch into ones working, solves all conflicts, tests the result and then merges the working branch into the target branch. This is done with
```sh
# merges 'target-branch' into curret branch
git merge <target-branch>

# proceeds after solving merge conflict
git merge --continue
```


### rebase

When following the philosophie of rebasing, one rebases the feature branch onto the target branch. This is done with
```sh
# rebase to (newest commit of) a branch
git rebase <target-branch>

# or rebase to a specific commit
git rebase <commit-hash>

# proceeds after solving rebase conflict
git rebase --continue
```
This is only necessary, if the 'main' branch progressed in the mean time, otherwise one just merges the feature branch into the 'main' branch.


## squash

"Squashing" commits (combining several commits into one commit) is done with an interactive rebase (`git rebase -i`).
Replace the `pick` with `squash` or just `s` for all commits to be combined.
Afterwards a force push is needed (`git push --force-with-lease`)

