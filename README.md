# os-images
Docker Images for RancherOS

This is a fork of `os-images` to work on Raspberry Pi 2, and all other ARM boards.
Switch to the `raspberrypi` branch to build this.

## Building

You need a linux machine with docker installed.

Linux laptop or VM
```
git clone https://github.com/luxas/os-base
cd os-base
git checkout raspberrypi
sudo ./build.sh
scp dist/artifacts/os-base.tar.xz [your rpi here]
```

Your Raspberry Pi
```
git clone https://github.com/luxas/os-images
cd os-images
git checkout raspberrypi

# Copy your os-base.tar.xz to this folder

sudo ./build.sh
```

At the moment you have to enter many times, for the buildroot config.
The image is going to be cross-compiled for ARM.

--------------------------------

## Contact
For bugs, questions, comments, corrections, suggestions, etc., open an issue in
 [rancher/os](//github.com/rancher/os/issues) with a title starting with `[os-images] `.

Or just [click here](//github.com/rancher/os/issues/new?title=%5Bos-images%5D%20) to create a new issue.
