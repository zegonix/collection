# summary on some steps in the git workflow

## Table of contents

- [branches](#branches)
  - [create a branch](#create-a-branch)
- [submodules](#submodules)


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
```bash
# do it manually
git submodule init
git submodule update

# do it all at once
git clone --recurse-submodules

# if repo is already cloned
git submodule update --init --recursive
```
