
## get/create image file
download and extract an image file **or** create one using `dd if=/dev/zero of=<image-file> bs=<block-size> count=<count>`.

## set image size
set image size with `truncate --size=<size> <image-file>`. this is usually used to increase image size in order to increase the file system size (i.e. make more space for rootfs)

## mount image
to mount an image file use 
```bash
mount -o loop <path/to/image-file> <mount-point>
```
if the image contains multiple partitions one needs to setup a loop device first:
```bash
losetup --find --show <path/to/image-file> -P
```
afterwards the partitions of the image should be shown as loopXpY and can be mounted like any other device.

## modify partition table with fdisk

### resize partition for rootfs

## resize filesystem

## mount boot partition

### make file 'ssh'

### make user config

### remove image resize from config file ~'cmdline.txt'

## mount rootfs partition

### do stuff
