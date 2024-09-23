
1. download image
1. extract image
1. enlarge image with 'truncate'
1. mount as loopback device
1. modify image
    1. modify partition table with fdisk
        1. resize partition for rfs
    1. resize filesystem
    1. mount boot partition
        1. make file 'ssh'
        1. make user config
        1. remove image resize from config file ~'cmdline.txt'
    1. mount rootfs partition
        1. do stuff