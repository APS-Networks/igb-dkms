tar xvf igb-5.4.6.tar.gz
cd igb-5.4.6

echo Patching checksum error...
patch -p1 < ../0000-remove-igb-checksum-error.patch

echo Patching kernel module version...
patch -p1 < ../0001-kernel-module-driver-version.patch

echo Patching in dpkg/dkms files...
patch -p1 < ../0002-dkms-debian-package.patch


dpkg-buildpackage --no-sign
