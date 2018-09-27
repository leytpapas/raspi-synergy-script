#!/bin/sh

echo "Automatic compile/installation of synergy-core on Debian Linux"

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git build-essential cmake libavahi-compat-libdnssd-dev libcurl4-openssl-dev libssl-dev lintian python qt4-dev-tools xorg-dev fakeroot

echo "Cloning synergy-core repository"
git clone https://github.com/symless/synergy-core.git
cd synergy-core
mkdir build
cd build
cmake ..
make
echo "Done compiling"
echo "Copying files"
cd ~/Downloads/synergy-core/build/bin
sudo cp syn* /usr/local/bin
echo "Enabling synergy client in every startup (Desktop autologin must be enabled)"
echo "Enter synergy-server's IP address or host name"
read str
#echo $str
mkdir -p ~/.config/autostart

out="[Desktop Entry]
Name=Synergy Client
Exec=/usr/local/bin/synergy-core --client $str
Type=application"

echo "$out" > ~/.config/autostart/synergy.desktop

echo "Finished"
echo "Cleaning up"
echo "Removing packages needed for compile"
sudo apt-get remove build-essential cmake libavahi-compat-libdnssd-dev libcurl4-openssl-dev libssl-dev lintian python qt4-dev-tools xorg-dev fakeroot
