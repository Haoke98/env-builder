# This script must be run as root.
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

# install and configure samba
yum -y install samba

# install lanproxy-client
wget https://gitee.com/sadam98/lanproxy/releases/download/v0.1/lanproxy-client-linux-386-20190523.tar.gz
tar -xvzf lanproxy-client-linux-386-20190523.tar.gz
mv ./client_linux_386 /opt/lanproxy_client
