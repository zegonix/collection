# grub

This file contains collected knowledge on `grub`.


## Table of contents

<!--toc:start-->
- [grub](#grub)
  - [Table of contents](#table-of-contents)
<!--toc:end-->


## reinstalling grub

use the following command to (re)install grub:

```sh
sudo grub-install --efi-directory=<boot-dir> --target=x86_64-efi <boot-partition>
# example
sudo grub-install --efi-directory=/boot --target=x86_64-efi /dev/nvmen1p1
```

**boot-dir** is the mount point of the bootloader partition.
**boot-partition** is the device path to the partition containing the bootloader
