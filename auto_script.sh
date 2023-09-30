#!/bin/bash

# 更新系统并安装必要的工具
yum update -y
sudo yum install -y wget

# 更改SELinux配置
sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config

# 安装Docker及Docker Compose
wget -qO- get.docker.com | bash

# Remove the 20-second sleep
# Check if Docker is already installed, display a warning, and proceed immediately
if command -v docker &> /dev/null; then
    echo "Docker is already installed. Continuing..."
else
    # Start Docker service
    sudo systemctl enable docker
    sudo systemctl start docker
fi

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# 设置时区为Asia/Shanghai
sudo timedatectl set-timezone Asia/Shanghai

# 输出当前日期和Docker版本信息
date
docker -v
docker-compose --version

# 输出银河云网络字符艺术

echo " █████╗  █████╗ ██████╗  ██████╗ ███╗   ██╗"
echo "██╔══██╗██╔══██╗██╔══██╗██╔═══██╗████╗  ██║"
echo "███████║███████║██████╔╝██║   ██║██╔██╗ ██║"
echo "██╔══██║██╔══██║██╔══██╗██║   ██║██║╚██╗██║"
echo "██║  ██║██║  ██║██║  ██║╚██████╔╝██║ ╚████║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
echo ""                                           

echo "   ###       ###    ########   #######  ##    ## "
echo "  ## ##     ## ##   ##     ## ##     ## ###   ## "
echo " ##   ##   ##   ##  ##     ## ##     ## ####  ## "
echo "##     ## ##     ## ########  ##     ## ## ## ## "
echo "######### ######### ##   ##   ##     ## ##  #### "
echo "##     ## ##     ## ##    ##  ##     ## ##   ### "
echo "##     ## ##     ## ##     ##  #######  ##    ## "


# 下载脚本
wget -N --no-check-certificate "https://gist.githubusercontent.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh"
chmod +x tcp.sh

# 运行脚本，并输入2选择安装BBRplus版内核
echo "2" | ./tcp.sh

# 重启系统
reboot
