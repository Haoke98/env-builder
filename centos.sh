# This script must be run as root.
# INPUT: 1.要自定义的ssh端口 （TODO：可以自动生成）
#        2.smb用户（TODO:可以自动生成）
#        3.smb用户密码 （TODO:可以自动生成）
#        4.内网穿透的客户端ID
#        5.内网穿透的公网服务器IP
#        6.内网穿透公网服务端口


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

# install lanproxy-client
wget https://gitee.com/sadam98/lanproxy/releases/download/v0.1/lanproxy-client-linux-386-20190523.tar.gz
tar -xvzf lanproxy-client-linux-386-20190523.tar.gz
mv ./client_linux_386 /opt/lanproxy_client
mv lanproxy.service /usr/lib/systemd/system/
systemctl start lanproxy
systemctl enable lanproxy
systemctl status lanproxy

#Python installation
wget https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz
tar -xvzf Python-3.11.1.tgz
cd Python-3.11.1.tgz
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel python3-devel libffi-devel
./configure --prefix=/opt/python3.11
make && make install
echo "PATH=/opt/python3.11/bin:$PATH" >> /etc/profile
source /etc/profile
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple


# iptables and firewall configuration
systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld
iptables -A INPUT -j ACCEPT


# install and configure samba
yum -y install samba
mv -f selinux /etc/sysconfig/selinux
mv -f smb.conf /etc/samba/
systemctl enable smb
useradd sadam
smbpasswd -a sadam
reboot # because after the change of the selinux it need to reboot the machine.
