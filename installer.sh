#!/data/data/com.termux/files/usr/bin/bash

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
RESET='\033[0m'
MAGENTA='\033[35m'
CYAN='\033[36m'

clear
echo "======================================"
echo "======== GSI Flasher Installer ========"
echo "======================================"

echo "installing (V1)..."
apt update -y
curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash
pkg install wget -y
pkg install libandroid-posix-semaphore
pkg reinstall libuuid
wget https://github.com/omar3elbakery/GSI-Flash-Tool/releases/download/GSI-Flash-Tool/Advanced.GSI-Flasher-Next-Gen-V1.sh
mv Advanced.GSI-Flasher-Next-Gen-V1.sh GSI-Flasher-V1 && chmod +x GSI-Flasher-V1 && mv GSI-Flasher-V1 /data/data/com.termux/files/usr/bin

echo "installing (V2)..."
wget https://github.com/omar3elbakery/GSI-Flash-Tool/releases/download/GSI-Flash-Tool/Automatic.GSI-Flasher-Next-Gen-V2.sh
mv Automatic.GSI-Flasher-Next-Gen-V2.sh GSI-Flasher-V2 && chmod +x GSI-Flasher-V2 && mv GSI-Flasher-V2 /data/data/com.termux/files/usr/bin
echo ""
echo ""
echo "<----Finished---->"