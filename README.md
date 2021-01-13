Intel IGB Driver for BF6064x-t
==============================

This repository creates a modified Intel IGB kernel driver in order to allow
network interfaces on the BF6064x-t to be used properly. 

There is an issue with the i210 Intel NICs, where a checksum stored on an eeprom
somewhere is either wrong or doesn't exist. When the module is
probed/initialised, the driver will fail to run. The patch prevents the driver
from terminating on this condition, although a kernel message will still be
recorded.

The build script creates a Debian package containing source code and patches for
creating a DKMS base driver. This means that when the operating system is
updated, the driver will be rebuilt, and the initial kernel will be updated to
include it.

The driver code is from Intel directly, and doesn't use the sources from the
kernel.


Building & Installing
---------------------

To build the debian package:

    ./build.sh

To install:

    sudo apt install ./igb-dkms_5.4.6-0_all.deb

If you have previously installed this package, you will likely need to run:

    sudo apt uninstall igb-dkms


A Note on the Module Version
----------------------------

Some versions of the Linux kernel use a modified IGB driver. However, some of
these use a different version to those supplied by Intel. The latest driver 
version from Intel is 5.4.6, and the kernel driver is version 5.6.0-k. If we were
to use the Intel version the driver won't be installed as, from the system's
point of view, it is an "older" driver. Consequently, the module version has 
been patched to become version 5.6.1.