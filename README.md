# Root OverlayFS for Raspberry Pi on Void Linux

### Usage
1. Checkout this repository on the Raspberry Pi, then enter the cloned directory.
2. Do `cp -r 95zoverlayfs /usr/lib/dracut/modules.d/`
3. Do `dracut --force /boot/initrd.img`
4. In `/boot/config.txt` add the following text:
```
initramfs initrd.img followkernel
```
5. In `/boot/cmdline.txt` add the following text at the end `boot=overlay`.

### Notes
The interface is designed to look like/mimick what Raspbian/Raspberry Pi OS does with overlayfs.
If you want to disable it you can disable booting from initramfs, remove `boot=overlay` or just change
`overlay` to anything else.

This is a rather hacky solution, but it works for me.
