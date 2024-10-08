# How to work with python venv

## create
Create a virtual environment with:
```
    python -m venv <path/and/name/of/venv-dir>
```
**Example:**
```
    python -m venv .venv
```
The example command creates a directory `.venv` (in the current working directory) containing the created virtual environment.

## use
To use/activate the virtual environment, source `<venv-dir>/bin/activate`.
**Example:**
```
    source .venv/bin/activate
```
or
```
    . .venv/bin/activate
```

To exit the virtual environment use the command/script `deactivate`.


## troubleshooting

### the command prompt does not show the venv prompt
If one customised the command prompt, that might interfere with the venv prompt.
When using `starship` one needs to enable and include the `python` module.