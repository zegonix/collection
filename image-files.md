# image files

- [image files](#image-files)
  - [create image file](#create-image-file)
  - [resize image](#resize-image)
  - [resize partition](#resize-partition)
  - [mount image files](#mount-image-files)
  - [setup image for Raspberry PI](#setup-image-for-raspberry-pi)


## create image file

To create an image file, use:
```bash
dd if=/dev/zero of=<image-file> bs=<block-size> count=<count>

# example: generate image with size of exactly 7.8 Gb
dd if=/dev/zero of=test.img bs=1000000 count=7800 conv=fsync
```


## resize image

One can change an images size with `truncate --size=<size> <image-file>`.
This is usually used to increase image size in order to increase the file system size (i.e. make more space for rootfs).
If the goal is to decrease the memory footprint, extra care has to be taken to not cripple the filesystem.


## resize partition

One can resize a partition (if there is no data afterwards) by deleting and remaking it with `fdisk`. Make sure to choose the same start sector!.


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

## setup image for Raspberry PI

This is a quick step through the setup of a raspbian image:

1. download image
1. truncate image (see [resize image](#resize-image))
1. resize partition with fdisk (see [resize partition](#resize-partition))
1. setup loop device for image (see [mount image files](#mount-image-files))
1. resize filesystem on said partition (loop device) with `resize2fs` (or similar)
1. mount boot partition (see [mount image files](#mount-image-files))
1. add empty file `ssh` to boot partition
1. add userconf.txt to boot partition, to set up initial user & password
1. disable resize script in boot/cmdline.txt (something with `firstboot`)
1. unmount partition and detach loop device
