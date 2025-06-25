# `ssh` & `scp`

This document holds various notes on `ssh` & `scp`.

<!--toc:start-->
- [`ssh` & `scp`](#ssh-scp)
  - [connect to client](#connect-to-client)
  - [generate ssh key](#generate-ssh-key)
<!--toc:end-->


## connect to client

In order to connect to a client use the `ssh` command with user and address as arguments.
Here some examples:

```sh
# connect as user on remote device
ssh <user>@<ip>
ssh pi@155.1.1.120

# connect as user via url
ssh <user>@<url>
ssh user@github.com
```


## generate ssh key

To generate a ssh keypair use `ssh-keygen`:

```sh
ssh-keygen -t ed25519
# or
ssh-keygen -t ed25519 -C "email@address.domain"
```

Place the generated keypair in `$HOME/.ssh` (on linux systems).
The `*.pub` file is the public key and the one to upload to `github` and Co.

> **Important:** double check that you never upload the private key!!


# TODO: add section `scp`
