# image files

- [create image file](#create-image-file)
- [change image size](#change-image-size)
- [mount image file](#mount-image-file)


## create image file

To create an image file, use:
```bash
dd if=/dev/zero of=<image-file> bs=<block-size> count=<count>

# example: generate image with size of exactly 7.8 Gb
dd if=/dev/zero of=test.img bs=1000000 count=7800 conv=fsync
```


## change image size

One can change an images size with `truncate --size=<size> <image-file>`. this is usually used to increase image size in order to increase the file system size (i.e. make more space for rootfs). If the goal is to decrease the memory footprint, extra care has to be taken to not cripple the filesystem.


## mount image files

To mount an image file use:
```bash
mount -o loop <path/to/image-file> <mount-point>
```
If the image contains multiple partitions one needs to setup a loop device first:
```bash
losetup --find --show <path/to/image-file> -P
```
Afterwards the partitions of the image should be shown as loopXpY and can be mounted like any other device.


## modify partition table with fdisk

### resize partition for rootfs

## resize filesystem

## mount boot partition

### make file 'ssh'

### make user config

### remove image resize from config file ~'cmdline.txt'

## mount rootfs partition

### do stuff
