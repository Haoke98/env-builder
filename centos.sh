yum -y update
yum -y upgrade
yum -y install lrzsz # can use rz,sz commands after install , be convenient to transfer.
yum -y install gcc # compile some source to the binary
yum -y install wget

# install ntfs-3g
wget https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2022.10.3.tgz
tar -xvzf ntfs-3g_ntfsprogs-2022.10.3.tgz
cd ntfs-3g_ntfsprogs-2022.10.3
./configure
make
make install
