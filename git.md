# summary on some steps in the git workflow

## Table of contents

- [git submodule](#git-submodule)


## git submodule
```bash
# do it manually
git submodule init
git submodule update

# do it all at once
git clone --recurse-submodules

# if repo is already cloned
git submodule update --init --recursive
```