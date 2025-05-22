#!/bin/sh
# prevent executing this script
exit

###################################################################################################
### miscellaneous
###################################################################################################
python3 ts_csv_converter.py export Dendrite_de.ts Dendrite_en.ts Dendrite_es.ts Dendrite_fr.ts Dendrite_it.ts out.csv
python3 ts_csv_converter.py import out.csv .

sudo usermod -aG tty dendrite

jq '.foo = "1"' test.json | sponge test.json
ffmpeg -i Recording.mp4 -vf "fps=10,scale=640:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 Recording.gif

apt-offline set --update apt-offline.sig # generate list of updatable packages
apt-offline get --bundle patches_1.zip apt-offline.sig # create patch bundle
pro security-status --esm-apps # list esm-apps packages

openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048 # generate private key
openssl rsa -in private.pem -pubout -out public.pem # generate public key
openssl dgst -sha256 -sign private.pem -out axon.zip.sig axon.zip # sign file
openssl dgst -sha256 -verify /opt/axon/public.pem -signature axon.zip.sig axon.zip # verify file

docker run --name ea-mysql -v /opt/projects/enterprise_architect/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=askion123 -d mysql:5
find . -xtype l -delete # remove broken symlinks

DISPLAY=:0 xinput test 10

cansend can0 100 # FF00000000000000
candump -t d can0,100:1F0 | grep -P "0\.0[1-9]" --color
candump -t d can0,100:1F0 | grep -P "0\.0[1-9]| 100 | 105" --color

sudo iptables --list --line-numbers # list rules with line numbers
sudo iptables -D INPUT 3 # delete rule in line number 3 within chain INPUT
sudo iptables -A INPUT -p tcp --dport 22 -j DROP # block all for SSH
sudo iptables -A INPUT -p tcp --dport 22 --source 10.239.135.61/32 -j ACCEPT # only allow specific IP for SSH

valgrind --tool=memcheck --leak-check=summary /opt/altostar/current/altostar-gui --log-level-console debug --offline-mode

lsusb -t
cat /proc/bus/input/devices
udevadm info --attribute-walk /sys/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0
udevadm trigger --dry-run --verbose
udevadm control --log-priority=debug
udevadm control --reload-rules
udevadm trigger

ps ahux --sort=-c | awk 'NR<=5{printf"%s %6d %s\n",$3,$2,$11}'

export PATH_PROTO=/home/agto/projects/altona/altostar/server_mock/v1/Interface
./protoc -I=proto/ --grpc_out=proto/ --plugin=protoc-gen-grpc=./grpc_cpp_plugin proto/CyclerToServerGeneral.proto
./protoc -I=$PATH_PROTO --grpc_out=$PATH_PROTO --plugin=protoc-gen-grpc=./grpc_cpp_plugin $PATH_PROTO/CyclerToServerGeneral.proto $PATH_PROTO/CyclerToServerRemote.proto $PATH_PROTO/CyclerToServerService.proto
./protoc -I=$PATH_PROTO --grpc_out=$PATH_PROTO --plugin=protoc-gen-grpc=./grpc_cpp_plugin $PATH_PROTO/ServerToCyclerGeneral.proto $PATH_PROTO/ServerToCyclerRemote.proto $PATH_PROTO/ServerToCyclerService.proto
./protoc -I=$PATH_PROTO --grpc_out=$PATH_PROTO --plugin=protoc-gen-grpc=./grpc_cpp_plugin $PATH_PROTO/CyclerToServerServiceInsecure.proto 
./protoc -I=$PATH_PROTO --cpp_out=$PATH_PROTO $PATH_PROTO/CyclerToServerGeneral.proto $PATH_PROTO/CyclerToServerRemote.proto $PATH_PROTO/CyclerToServerService.proto
./protoc -I=$PATH_PROTO --cpp_out=$PATH_PROTO $PATH_PROTO/ServerToCyclerGeneral.proto $PATH_PROTO/ServerToCyclerRemote.proto $PATH_PROTO/ServerToCyclerService.proto
./protoc -I=$PATH_PROTO --cpp_out=$PATH_PROTO $PATH_PROTO/CyclerToServerServiceInsecure.proto
cmake -DgRPC_INSTALL=ON -DgRPC_BUILD_TESTS=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$MY_INSTALL_DIR ../..

ip addr del 192.168.56.110 dev enp2s0

LD_LIBRARY_PATH=/opt/pylon/lib:/opt/ic-flow2/usr/lib /opt/ic-flow2/usr/bin/ic-flow2 --camera basler --data /opt/ic-flow2/data --internal enabled

# client_id		292912784087-q0sdo2v3ldordunm0nfkl6j4e6gt46jb.apps.googleusercontent.com
# client_secret	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

rclone config create --drive-client-id "292912784087-q0sdo2v3ldordunm0nfkl6j4e6gt46jb.apps.googleusercontent.com" --drive-client-secret "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" ic-flow2 drive

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout 0
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.desktop.session idle-delay 0

mogrify *.png

addr2line -asfpC -e dptv 0x114510

cmake -DCMAKE_TOOLCHAIN_FILE=/home/agto/projects/renew/ic-flow-2.0/mxe/usr/i686-w64-mingw32.static/share/cmake/mxe-conf.cmake -DCMAKE_PREFIX_PATH=/home/agto/projects/renew/ic-flow-2.0/mxe/usr/i686-w64-mingw32.static/qt5/

gst-launch-1.0 -v filesrc location=test.png ! decodebin ! videoconvert ! imagefreeze ! autovideosink

docker run -dit --name altostar-imx8 --entrypoint /bin/bash -v /opt/yocto/downloads:/home/yocto/downloads -v /opt/yocto/altostar-imx8/deploy:/home/yocto/deploy altostar-imx8:latest
docker run -d -p 32778:22 -v /home/agto/projects/clade/mira2:/root/workdir --name clade_build ubuntu:clade_build
docker run -d -p 32779:22 -v /home/agto/projects/renew/ic-flow-2.0:/root/workdir --name ic-flow2-build ubuntu:ic-flow2-build
docker run -v /home/agto/projects/altona/altostar/AltoStarApp/:/opt/workdir --name altostar_build_imx8 altostar:build-imx8
docker run -dit --name build-axon --entrypoint /bin/bash -v /home/agto/projects/axon/dendrite/axon_dendrite/:/opt/workdir build-axon:22.04

LD_LIBRARY_PATH=/opt/pylon/lib:/opt/ic-flow2/deploy/usr/lib startx /opt/ic-flow2/deploy/usr/bin/ic-flow2 --camera basler --data /opt/ic-flow2/deploy/data --internal enabled &
# configure static IP for ethernet connected to camera
# implement systemd unit files for check for update, start application 
# disable X server display blanking

timedatectl set-ntp false
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u -k all 
sudo apt install gstreamer1.0-libav ubuntu-restricted-extras
sudo systemctl set-default multi-user.target # disable GUI (Desktop)
gnome-session-quit # quit GUI (Desktop)
sudo systemctl set-default graphical # enable GUI (Desktop)
sudo systemctl start gdm3 # start GUI (Desktop)

xzcat ~/Downloads/ubuntu-core-22-amd64.img.xz | sudo dd of=/dev/sdg bs=32M status=progress

pkg-config --cflags atkmm-1.6

./TestSequenzer SoM_Livetick_Simulation.xml -u agto > /dev/null &
systemctl stop X
scp raumedic_neurosmart root@192.168.0.2:/home/root/neurosmart/update

docker run -d -p 32777:22 -v /home/$USER/projects/$PROJECT/$REPO:/root/workdir -v /home/$USER/projects/$PROJECT/$REPO/build:/root/builddir --name qt_build ubuntu:qt_build


export event=0xF22
cansend can1 -i 0x203 0x00 0x00 $((event/256)) $event 0x11 0x22 0x33 0x44

QTWEBENGINE_DISABLE_SANDBOX=1
rsync -a --exclude=.cache --exclude=Downloads --progress /home/$USER /media/agto/agto/rsync #sync home
libreoffice --headless --convert-to pdf <docx> # convert to pdf
lp -P 1 <pdf> # print first page on default printer
pdftk A=?.pdf B=?.pdf cat B1 A2-end output ?.pdf # generate PDF from several PDF files (merge, split, delete)
pdftk ?.pdf burst # split PDF into single pages

git clone git@10.239.130.226:/git/oem-projects...
git commit --amend --reset-author
git tag -a v1.2
git push --tags

sudo modprobe can
sudo modprobe can-raw
sudo modprobe slcan
sudo slcan_attach -f -s4 -o /dev/ttyACM0
sudo slcand ttyACM0 slcan0
sudo ifconfig slcan0 up

export bootargs="console=ttymxc0,115200n8 consoleblank=0 vt.global_cursor_default=0  root=/dev/mmcblk0p2 video=-32 overlayrw=/dev/mmcblk0p3"
sudo ifconfig can0 txqueuelen 1000
systemctl disable dptv
kill -TERM `pidof <app>` && sleep 1 && echo "V" > /dev/watchdog
kill `pidof <app>`
kill -SEGV `pidof <app>`
top -H -p `pidof <app>`
gdbserver --attach :2345 `pidof <app>`
cat -n language.ini | awk '{print "longest_line_number: " $1 " length_with_line_number: " length}' | sort -k4 -nr | head -1
./lupdate -noobsolete /path/to/.pro/file
sudo nmap -sS -sU -T5 -A -v 192.168.0.1/24

sudo ip link add dev vcan0 type vcan
sudo ip link set up vcan0

sudo apt install isc-dhcp-server
systemctl start isc-dhcp-server
systemctl status isc-dhcp-server
sudo ufw allow 67/udp

export DISPLAY=:0
xfce4-session-logout -lf

cat language.ini | python3 language_ini_to_csv.py > language.csv # INI to CSV for language.ini with python script
cat language.csv | python3 language_csv_to_ini.py # CSV to INI for language.ini with python script
dd if=/dev/mmcblk1 of=/dev/mmcblk0 bs=1M conv=fsync
Subsystem sftp internal-sftp # SSH hack for poky build (dmo)
G_TLS_GNUTLS_PRIORITY="NORMAL:%COMPAT:+VERS-TLS1.0" evolution # start evolution with legacy TLS1.0 support
sudo usermod -aG plugdev $USER # accessing device without sudo
ssh-keyscan -H 192.168.0.2 >> ~/.ssh/known_hosts # add host key to known_hosts file
pkg-config --cflags --libs gtkmm-2.4 # get dependencies for gtkmm 2.4 for project settings in eclipse without using pkg-config plugin
cmake -DCMAKE_PREFIX_PATH=$HOME/Qt/5.12.5/gcc_64 .. # for compiling mxe
sudo adduser $USER dialout # add user to dialout group to connect serial via putty
vboxmanage internalcommands createrawvmdk -filename ~/win7.vmdk -rawdisk /dev/sda -partitions 2 -relative # create raw virtual hard disk for virtual box
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa # generates authentication keys for SSH
diff -u <file.orig> <file.edited> > file.patch # generate patch file, adapt header
tar -xvf home_root.tar -C / # extract to root folder
tar -cvf home_root.tar /home/ # saves home/ recursively to archive
vi /etc/systemd/journald.conf # set journal Storage=persistent
tail -f `ls -tr | tail -1` # follow newest file in current folder
pkill -f "WriteFileFromTTYMXC *" # kill specific process
systemctl list-unit-files | grep enabled # list enabled systemd units
ln -s f1/ current # create a symlink
ln -sfn /new/target /path/to/symlink # replace an existing symlink
udevadm monitor -u # monitors current udev rules actions
dd if=/dev/zero of=/home/root/dummy.img bs=1M count=1000 # generate dummy file on disk
truncate -s 2500M database.db # generate sparse file with given size
cpufreq-set -c 0 -f 792000 # set cpu freq to fixed value
arm-angstrom-linux-gnueabi-gdb # name of gdb debugger
ssh -X root@192.168.0.2 # ssh connect with X11 forwarding
find / -type f -size +10000k # list files greater than size
pmap -xq `pidof <app>` | sort -k2,3 | grep -c ? #memory map of specific process
vi /etc/resolv.conf  # set nameserver to 10.239.135.101
connmanctl config `connmanctl services | grep ethernet | awk '{print $3}'` --ipv4 manual 10.239.134.150 255.255.255.0 10.239.135.254 #set static IP and gateway
connmanctl config `connmanctl services | grep ethernet | awk '{print $3}'` --ipv4 manual 192.168.0.2 255.255.255.0 #set static IP
connmanctl config `connmanctl services | grep ethernet | awk '{print $3}'` --nameservers 10.239.130.200 #set DNS
connmanctl enable ethernet # enable ethernet permanently
ifconfig eth0 192.168.0.3/24
ifconfig eth0 10.239.134.72 netmask 255.255.240.0
ip addr add 10.239.134.72/24 dev eth0
ip route add default via 10.239.135.254
cat /proc/meminfo # get memory info
cd ~/oe-core/build/tmp-glibc/work-shared/colibri-imx6/kernel-source/drivers/video/logo/ #path for splash file logo_custom_clut224.ppm

###################################################################################################
### Qt Creator settings
###################################################################################################

# Clang format
{BasedOnStyle: LLVM, ColumnLimit: '180', IndentWidth: 4, BreakBeforeBraces: Stroustrup, BreakConstructorInitializersBeforeComma: false, AllowShortFunctionsOnASingleLine: false, AlwaysBreakBeforeMultilineStrings: false, Standard: Auto}

###################################################################################################
### Disable mouse pointer for X server > /usr/bin/startx
###################################################################################################

***************************************************************************************************
defaultserverargs="-nocursor"
***************************************************************************************************

###################################################################################################
### Disable display blanking for X server > /etc/X11/xinit/xinitrc
###################################################################################################

***************************************************************************************************
xset s off         # don't activate screensaver
xset -dpms         # disable DPMS (Energy Star) features.
xset s noblank     # don't blank the video device
***************************************************************************************************

###################################################################################################
### QEMU Ubuntu Core
###################################################################################################

qemu-system-x86_64 \
    -enable-kvm \
    -smp 2 \
    -m 1500 \
    -cpu host \
	-vga std \
    -netdev user,id=mynet0,hostfwd=tcp::8022-:22,hostfwd=tcp::8090-:80 \
	-net nic \
    -device virtio-net-pci,netdev=mynet0 \
    -drive file=ubuntu-core-20-amd64.img,format=raw \
    -drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on
	
ssh thomas-oppel@10.0.2.15
ssh thomas-oppel@localhost -p 8022

###################################################################################################
### Unable to negotiate with IP port 22: no matching host key type found. Their offer: ssh-rsa
###################################################################################################

vim ~/.ssh/config

***************************************************************************************************
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedAlgorithms +ssh-rsa
***************************************************************************************************

###################################################################################################
### deploy fonts to target
###################################################################################################

# copy all fonts to /usr/share/fonts/ttf
fc-cache -f -v #clear and regenerate font cache

###################################################################################################
### docker
###################################################################################################

docker system prune #remove unused data
docker rmi $(docker images -a -q) #remove all images
docker images purge #?
docker ps -a #list all running container
docker inspect <container_id or name>
docker build -t <?:?> . #build docker image from Dockerfile

# run docker image as container named "qt_build" (<work_dir> is where you checkout your project)
docker run -d -p 32777:22 -v <work_dir>:/root/<your_path> --name qt_build ubuntu:qt_build

# connect to container via SSH
ssh root@localhost -p 32777 #password "root"

# source build environment within container
. /usr/local/oecore_dornier/environment-setup-cortexa9hf-neon-poky-linux-gnueabi

# cd to <your_path>
cd <your_path>

# generate Makefile using cross-built qmake
/etc/qt5dmo/qt5/bin/qmake <path_to_pro_file> CONFIG+=debug
make -j<number_of_cores>

docker load < qt_build.tar

###################################################################################################
### import and rename duplicated volume group of LVM partitions
###################################################################################################
vgimportclone --basevgname ubuntu-vg_snap /dev/sdc2
vgchange -ay ubuntu-vg_snap
vgchange -an ubuntu-vg_snap

###################################################################################################
### load kernel module at boot time (vcan) for Ubuntu <= 18.04 LTS
###################################################################################################
# /etc/modules
***************************************************************************************************
vcan
***************************************************************************************************

# /etc/network/interfaces
***************************************************************************************************
auto vcan0
   iface vcan0 inet manual
   pre-up /sbin/ip link add dev $IFACE type vcan
   up /sbin/ifconfig $IFACE up
***************************************************************************************************

###################################################################################################
### load kernel module at boot time (vcan) for Ubuntu 20.04 LTS
###################################################################################################
# generate file "80-can.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=vcan0
***************************************************************************************************

###################################################################################################
### assign static IP address in systemd-networkd
###################################################################################################
# generate file "eth0.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=eth0

[Network]
Address=192.168.0.20/24
***************************************************************************************************

###################################################################################################
### assign static IP address in systemd-networkd
###################################################################################################
# generate file "<netdev>.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=<netdev>

[Network]
Address=10.239.134.xx/20
DNS=10.239.130.200
Gateway=10.239.135.254
***************************************************************************************************

###################################################################################################
### bring up CAN device with systemd-networkd
###################################################################################################
# generate file "80-can.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=can0

[CAN]
BitRate=125K
RestartSec=100ms
***************************************************************************************************

###################################################################################################
### add DNS domain
###################################################################################################
sudo vim /etc/systemd/resolved.conf

***************************************************************************************************
Domain=askion.de
***************************************************************************************************

systemctl restart systemd-resolved.service

###################################################################################################
### assign static IP address with NetworkManager
###################################################################################################
nmcli connection
nmcli connection edit <connection-name>
nmcli> goto ipv4
nmcli ipv4> set method manual 
nmcli ipv4> set addresses 10.239.134.196/24
nmcli ipv4> set gateway  10.239.135.254
nmcli ipv4> set dns 10.239.130.200
nmcli ipv4> save
nmcli ipv4> quit

###################################################################################################
### delete logfiles older than x days
###################################################################################################
if [[ $(ls /home/root/.../log | wc -l) > 1000 ]]
then
  find /home/root/.../log -name "*.log" -type f -mtime +200 -exec rm -f {} \;
fi

###################################################################################################
### disable GRUB at boot
###################################################################################################

***************************************************************************************************
### BEGIN /etc/grub.d/40_custom ###
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

set timeout_style=hidden
set timeout=0
***************************************************************************************************

###################################################################################################
### enable GTK inspector keybindings (ctrl + d)
###################################################################################################
### start dconf-editor
### navigate to org > gtk > settings > debug
### set enable-inspector-keybindings to true
###################################################################################################

###################################################################################################
### install virtualbox 6.0 in Ubuntu
###################################################################################################

sudo apt update
sudo apt upgrade
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install virtualbox-6.1

###################################################################################################
### printers in Ubuntu
###################################################################################################

sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed
# or
sudo cupsctl --no-share-printers
# or
sudo nano /etc/cups/cups-browsed.conf
***************************************************************************************************
BrowseProtocols none
***************************************************************************************************
# or
sudo nano /etc/cups/cupsd.conf
***************************************************************************************************
Browsing Off
***************************************************************************************************

###################################################################################################
### gsettings
###################################################################################################
cat ~/.config/gtk-3.0/settings.ini

***************************************************************************************************
[Settings]
gtk-cursor-blink = false
gtk-enable-animations = false
gtk-long-press-time = 5000
***************************************************************************************************

###################################################################################################
### I2C settings for LM48100Q-Q1 Boomer™ Mono (adapt i2cset tool)
###################################################################################################
/home/root/i2cset -y 2 0x7c 0x14 # power on
/home/root/i2cset -y 2 0x7c 0x73 # set volume to 0dB (step 20)
/home/root/i2cset -y 2 0x7c 0x75 # set volume to 3dB (step 22)
/home/root/i2cset -y 2 0x7c 0x77 # set volume to 6dB (step 24)
/home/root/i2cset -y 2 0x7c 0x79 # set volume to 9dB (step 26)
/home/root/i2cset -y 2 0x7c 0x7B # set volume to 12dB (step 28)
/home/root/i2cset -y 2 0x7c 0x7D # set volume to 15dB (step 30)
/home/root/i2cset -y 2 0x7c 0x7F # set volume to 18dB (step 32)
/home/root/i2cset -y 2 0x7c 0x24 # reset diagnostic control

###################################################################################################
### ALSA
###################################################################################################
alsamixer
amixer sset 'Headphone' 100%
amixer sset 'PCM' 75%
aplay ding.wav
speaker-test -c 1 -D hw:0 # pink noise
speaker-test -t sine -f 1000 -c 1 -D hw:0

###################################################################################################
### GPIO (example for set up GPIO port for soft poweroff)
###################################################################################################
echo 55 > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio55/direction
echo "falling" > /sys/class/gpio/gpio55/edge

###################################################################################################
###timedatectl / date / hwclock
###################################################################################################
timedatectl set-local-rtc 1 --adjust-system-clock # disable UTC and use local time (for dual boot)
timedatectl set-ntp 0 # disable "timesyncd" network time protocol
timedatectl set-time "yyyy-mm-dd hh:mm" #set time
date -s "yyyy-mm-dd hh:mm" #set time
hwclock -w # set hardware clock (RTC) from system time
hwclock -s # set system time from hardware clock (RTC)

###################################################################################################
### flashing SOM
###################################################################################################
setenv board_name # colibri_imx6_...
run setsdupdate
run update_spl
run update_uboot
reset

env default -a
setenv board_name # colibri_imx6_...
setenv vidargs
setenv fdt_file # imx6dl-colibri_....dtb
saveenv
run setsdupdate
run update

###################################################################################################
### generate dummy sqlite3 database
###################################################################################################
### generate empty database "database.db"
### read "database_create.sql" script for create all tables, views, triggers, indexes
### read "database_10d.sql" script for insert dummy data (takes long time depending on script size)
###################################################################################################
sqlite3 database.db
.read database_create.sql
.read database_10d.sql
.quit

###################################################################################################
### install legacy glade designer 3.8.6
###################################################################################################
### download source from http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/
### extract archive
### read INSTALL doc -> install necessary packages for "make" first
### install libgladeui-1-11_3.8.0-0ubuntu6.1_amd64.deb with dpkg
###################################################################################################
sudo apt install intltool
sudo apt install libgtk2.0-dev
sudo apt install libxml2-dev
sudo apt install itstool
./configure
sudo make
sudo make install
sudo dpkg -i libgladeui-1-11_3.8.0-0ubuntu6.1_amd64.deb

###################################################################################################
### install googletest
###################################################################################################
sudo apt install libgtest-dev cmake
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib

###################################################################################################
### using gdb for debugging
###################################################################################################
gdbserver host:2345 <app> # start app with gdbserver
gdbserver --attach :2345 `pidof <app>` # attach gdbserver to running app

###################################################################################################
### using gdb for analyse coredumps
###################################################################################################
. /usr/local/oecore_.../environment-setup-armv7at2hf-neon-angstrom-linux-gnueabi
${CROSS_COMPILE}gdb <app> <coredump>
set sysroot /usr/local/oecore_.../sysroots/armv7at2hf-neon-angstrom-linux-gnueabi
info threads
bt full

###################################################################################################
### useful bitbake commands
###################################################################################################
. export
bitbake <target> -c cleansstate
bitbake <target> -c menuconfig
bitbake <target> -c diffconfig
bitbake <target> -f -c compile 
bitbake -k <target>
bitbake <target> -c populate_sdk

###################################################################################################
### u-boot -> prepare for flash os from booting via sftp
###################################################################################################
sudo tar -xjf Colibri_iMX6_LinuxImageV2.8_xxxxxxxx.tar.bz2
cd ...image_folder...
./update.sh –o /media/...tftp_root_folder...

fw_setenv fdt_file imx6dl-colibri_....dtb

fw_setenv bootcmd_flag 1
fw_setenv bootcmd "if env exists bootcmd_flag; then sleep 3; setenv bootcmd_flag; saveenv; setenv autoload 0; dhcp && run setethupdate && run update; fi; run emmcboot ; echo ; echo emmcboot failed ; run distro_bootcmd ; usb start ;setenv stdout serial,vga; setenv stdin serial,usbkbd"
reboot

fw_setenv bootcmd_flag 1
fw_setenv bootcmd "if env exists bootcmd_flag; then sleep 3; setenv bootcmd_flag; saveenv; setenv autoload 0; dhcp && run setethupdate && run update_fdt; fi; run emmcboot ; echo ; echo emmcboot failed ; run distro_bootcmd ; usb start ;setenv stdout serial,vga; setenv stdin serial,usbkbd"
reboot

###################################################################################################
### u-boot -> remove console tty1 from the boot arguments 
### u-boot -> disable the blinking cursor by adding vt.global_cursor_default=0
###################################################################################################
fw_setenv setup 'setenv setupargs fec_mac=${ethaddr} no_console_suspend=1 vt.global_cursor_default=0 console=${console},${baudrate}n8'

###################################################################################################
### u-boot -> vidargs
###################################################################################################

fw_setenv vidargs "video=mxcfb0:1280x800M@60 video=mxcfb1:off fbmem=32M" # AltoStar
fw_setenv vidargs "video=mxcfb0:dev=lcd,FusionF07A"
fw_setenv vidargs "video=mxcfb0:dev=lcd,EDT-WVGA"
fw_setenv vidargs "video=mxcfb0:dev=lcd,800x480M@60,if=RGB24,bpp=24 fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=hdmi,1280x1024M@60,if=RGB24 fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=lcd,ETML1010G0DKA@60,if=RGB24,bpp=24 video=mxcfb1:off fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=lcd,1280x800M@60,if=RGB24 video=mxcfb1:off fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=lcd,1280x800M@60 video=mxcfb1:off fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=lcd,1920x1080M@60,if=RGB24 video=mxcfb1:off fbmem=32M"
fw_setenv vidargs "video=mxcfb0:dev=hdmi,1920x1080M@60,if=RGB24 fbmem=32M"

###################################################################################################
### commands for rotating display and touch
###################################################################################################

fbset -t 14064 5 5 18 2 150 3 # set timings for frame buffer device
xinput set-prop 7 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1 # rotate touch 90° left
xinput set-prop 7 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1 # rotate touch 90° right
xinput set-prop 7 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1 # rotate touch 180° inverted
xrandr -o left # rotate display 90° left
xrandr -o right # rotate display 90° right
xrandr -o inverted # rotate display 180° inverted
xrandr --output "DISP3 BG" --scale 1x0.99125 # scale display output  

###################################################################################################
### manually calibrate touch after inverting display
###################################################################################################
### run xinput_calibrator on X startup
### do calibration
### write output text manually to /etc/X11/xorg.conf.d/99-calibration.conf
###################################################################################################

***************************************************************************************************

Section "InputClass"
Identifier        "calibration"
MatchProduct        "USBest Technology SiS HID Touch Controller"
Option        "Calibration"        "5 4102 212 4293"
Option        "SwapAxes"        "0"
EndSection

***************************************************************************************************

###################################################################################################
###systemd service -> common commands
###################################################################################################
systemctl enable/disable ...any_service... -> systemctl disable getty@tty1.service
systemctl daemon-reload
systemctl status runX -n1000

###################################################################################################
### systemd service -> autologin
###################################################################################################
ln -sf /lib/systemd/system/getty@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
vi /etc/systemd/system/getty.target.wants/getty@tty1.service

***************************************************************************************************
...
...
...
ExecStart=-/sbin/agetty --autologin root --noclear %I $TERM
...
...
...
***************************************************************************************************

systemctl enable getty@tty1.service
systemctl daemon-reload

###################################################################################################
### systemd service -> start script
###################################################################################################
vi /lib/systemd/system/<name>.service
	
***************************************************************************************************
[Unit]
Description=... start service
After=network.target

[Service]
Type=normal
ExecStart=/home/root/...

[Install]
WantedBy=multi-user.target
***************************************************************************************************

###################################################################################################
### systemd service -> start X server
###################################################################################################
vi /lib/systemd/system/X.service
	
***************************************************************************************************
[Unit]
Description=start X server

[Service]
Type=simple
ExecStart=/usr/bin/startx -- -nocursor

[Install]
WantedBy=multi-user.target
***************************************************************************************************

systemctl enable X
systemctl daemon-reload
vi /etc/X11/xinit/xinitrc

10.239.130.211 # Mailserver
10.239.135.48 # UTAX
0452:qwertz123@10.239.129.1:65443 # Starface
localhost:631 # CUPS
SoftwGit # git
git20admin2! # gitadmin
askion1209$@ASKION_GAST
askion2021$@ASKION_INTERN
cert intermediate X4yhsoBp
r5K:g9_M
d1N_5uk2
y7D!q0_$

