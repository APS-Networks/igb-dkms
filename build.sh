tar xvf igb-5.4.6.tar.gz
cd igb-5.4.6
patch -p1 < ../0001-dkms-debian-package.patch
patch -p1 < ../0001-Kernel-module-driver-version.patch
# patch -p1 < ../0000-avoid-igb-checksum-error.patch

dpkg-buildpackage --no-sign
