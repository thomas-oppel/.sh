#!/bin/sh
#prevent executing this script
exit

###################################################################################################
###miscellaneous
###################################################################################################
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

cat language.ini | ./language_ini_to_csv.py > language.csv #INI to CSV for language.ini with python script
cat language.csv | ./language_csv_to_ini.py #CSV to INI for language.ini with python script
dd if=/dev/mmcblk1 of=/dev/mmcblk0 bs=1M conv=fsync
Subsystem sftp internal-sftp #SSH hack for poky build (dmo)
G_TLS_GNUTLS_PRIORITY="NORMAL:%COMPAT:+VERS-TLS1.0" evolution #start evolution with legacy TLS1.0 support
pdftk A=?.pdf B=?.pdf cat B1 A2-end output ?.pdf #generate PDF from several PDF files (merge, split, delete)
sudo usermod -aG plugdev $USER #accessing device without sudo
ssh-keyscan -H 192.168.0.2 >> ~/.ssh/known_hosts #add host key to known_hosts file
pkg-config --cflags --libs gtkmm-2.4 #get dependencies for gtkmm 2.4 for project settings in eclipse without using pkg-config plugin
cmake -DCMAKE_PREFIX_PATH=$HOME/Qt/5.12.5/gcc_64 .. #...for compiling mxe
qtcreator -graphicssystem raster #possible workaround for lazy Qt Creator
qtcreator -graphicssystem native #possible workaround for lazy Qt Creator
sudo adduser $USER dialout #add user to dialout group to connect serial via putty
vboxmanage internalcommands createrawvmdk -filename ~/win7.vmdk -rawdisk /dev/sda -partitions 2 -relative #create raw virtual hard disk for virtual box
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa #generates authentication keys for SSH
ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa #generates authentication keys for SSH
diff -u <file.orig> <file.edited> > file.patch #generate patch file, adapt header
tar -xvf home_root.tar -C / # extract to root folder
tar -cvf home_root.tar /home/ #saves home/ recursively to archive
vi /etc/systemd/journald.conf #set journal Storage=persistent
tail -f `ls -tr | tail -1` #follow newest file in current folder
pkill -f "WriteFileFromTTYMXC *" #kill specific process
systemctl list-unit-files | grep enabled #list enabled systemd units
ln -s f1/ current #create a symlink
ln -sfn /new/target /path/to/symlink #replace an existing symlink
udevadm monitor -u #monitors current udev rules actions
dd if=/dev/zero of=/home/root/dummy.img bs=1M count=1000 #generate dummy file on disk
truncate -s 2500M database.db #generate sparse file with given size
cpufreq-set -c 0 -f 792000 #set cpu freq to fixed value
arm-angstrom-linux-gnueabi-gdb #name of gdb debugger
ssh -X root@192.168.0.2 #ssh connect with X11 forwarding
find / -type f -size +10000k #list files greater than size
pmap -xq `pidof <app>` | sort -k2,3 | grep -c ? #memory map of specific process
vi /etc/resolv.conf  #set nameserver to 10.239.135.101
connmanctl config `connmanctl services | grep ethernet | awk '{print $3}'` --ipv4 manual 10.239.134.150 255.255.255.0 10.239.135.254 #set static IP and gateway
connmanctl config `connmanctl services | grep ethernet | awk '{print $3}'` --ipv4 manual 192.168.0.2 255.255.255.0 #set static IP
connmanctl enable ethernet #enable ethernet permanently
ifconfig eth0 192.168.0.3/24
ifconfig eth0 10.239.134.72 netmask 255.255.240.0
ip addr add 10.239.134.72/24 dev eth0
ip route add default via 10.239.135.254
cat /proc/meminfo #get memory info
cd ~/oe-core/build/tmp-glibc/work-shared/colibri-imx6/kernel-source/drivers/video/logo/ #path for splash file logo_custom_clut224.ppm

###################################################################################################
###docker
###################################################################################################

docker system prune #remove unused data
docker rmi $(docker images -a -q) #remove all images
docker images purge #?
docker ps -a #list all running container
docker inspect <container_id or name>
docker build -t <?:?> . #build docker image from Dockerfile

#run docker image as container named "qt_build" (<work_dir> is where you checkout your project)
docker run -d -p 32777:22 -v <work_dir>:/root/<your_path> --name qt_build ubuntu:qt_build

#connect to container via SSH
ssh root@localhost -p 32777 #password "root"

#source build environment within container
. /usr/local/oecore_dornier/environment-setup-cortexa9hf-neon-poky-linux-gnueabi

#cd to <your_path>
cd <your_path>

#generate Makefile using cross-built qmake
/etc/qt5dmo/qt5/bin/qmake <path_to_pro_file> CONFIG+=debug
make -j<number_of_cores>

###################################################################################################
###uBlock Origin
###################################################################################################

***************************************************************************************************
google.*##.widget-consent-fullscreen.widget-consent
||consent.google.com^
google.*##+js(aeld, DOMContentLoaded, CONSENT)
www.google.*##div[jsname][jsaction^="dg_close"]
www.google.*##html:style(overflow: visible !important;)
www.google.*###lb
youtube.com##ytd-popup-container
youtube.com##ytd-consent-bump-lightbox.style-scope
www.youtube.com##.opened
***************************************************************************************************

###################################################################################################
###import and rename duplicated volume group of LVM partitions
###################################################################################################
vgimportclone --basevgname ubuntu-vg_snap /dev/sdc2
vgchange -ay ubuntu-vg_snap
vgchange -an ubuntu-vg_snap

###################################################################################################
###support legacy SMB1 protocol
###################################################################################################
#/etc/samba/smb.conf
***************************************************************************************************
[global]

case sensitive = yes
getwd cache = yes
preserve case = yes
short preserve case = yes
socket options = TCP_NODELAY IPTOS_LOWDELAY SO_KEEPALIVE
ntlm auth = ntlmv1-permitted
server min protocol = NT1
server max protocol = NT1
client min protocol = NT1
client max protocol = NT1
***************************************************************************************************

###################################################################################################
###load kernel module at boot time (vcan) for Ubuntu <= 18.04 LTS
###################################################################################################
#/etc/modules
***************************************************************************************************
vcan
***************************************************************************************************

#/etc/network/interfaces
***************************************************************************************************
auto vcan0
   iface vcan0 inet manual
   pre-up /sbin/ip link add dev $IFACE type vcan
   up /sbin/ifconfig $IFACE up
***************************************************************************************************

###################################################################################################
###load kernel module at boot time (vcan) for Ubuntu 20.04 LTS
###################################################################################################
#generate file "80-can.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=vcan0
***************************************************************************************************

###################################################################################################
###assign static IP address in systemd-networkd
###################################################################################################
#generate file "eth0.network" in /etc/systemd/network
***************************************************************************************************
[Match]
Name=eth0

[Network]
Address=192.168.0.20/24
***************************************************************************************************

###################################################################################################
###delete logfiles older than x days
###################################################################################################
if [[ $(ls /home/root/.../log | wc -l) > 1000 ]]
then
  find /home/root/.../log -name "*.log" -type f -mtime +200 -exec rm -f {} \;
fi

###################################################################################################
###disable GRUB at boot
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
###enable GTK inspector keybindings (ctrl + d)
###################################################################################################
###start dconf-editor
###navigate to org > gtk > settings > debug
###set enable-inspector-keybindings to true
###################################################################################################

###################################################################################################
###install virtualbox 6.0 in ubuntu
###################################################################################################

sudo apt update
sudo apt upgrade
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install virtualbox-6.1

###################################################################################################
###printers in ubuntu
###################################################################################################

sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed
#or
sudo cupsctl --no-share-printers
#or
sudo nano /etc/cups/cups-browsed.conf
***************************************************************************************************
BrowseProtocols none
***************************************************************************************************
#or
sudo nano /etc/cups/cupsd.conf
***************************************************************************************************
Browsing Off
***************************************************************************************************

###################################################################################################
###example script for starting application in terminal
###################################################################################################

***************************************************************************************************
#!/bin/bash

echo <password> | sudo -S ip link add dev vcan0 type vcan
echo <password> | sudo -S ip link set up vcan0
pkill -f "<app>"
~/tmp/socket_can_simulator &
pkill -f "<app>"
gnome-terminal --geometry=600x900+100+100 -x bash -c "cd ~/tmp; GTK_THEME=Adwaita:dark <app> -v"
***************************************************************************************************

###################################################################################################
###gsettings
###################################################################################################
cat ~/.config/gtk-3.0/settings.ini

***************************************************************************************************
[Settings]
gtk-cursor-blink = false
gtk-enable-animations = false
gtk-long-press-time = 5000
***************************************************************************************************

###################################################################################################
###required and useful tools for development in linux
###################################################################################################
sudo apt install geany
sudo apt install glade
sudo apt install doublecmd-gtk
sudo apt install filezilla
sudo apt install libgtkmm-3.0-dev 
sudo apt install sqlite3
sudo apt install compizconfig-settings-manager
sudo apt install gnome-tweak-tool 
sudo apt install dconf-editor
sudo apt install openjdk-11-jre 
sudo apt install nfs-common 
sudo apt install libbz2-dev
sudo apt install libasound2-dev
sudo apt install libcanberra-gtk3-dev
sudo apt install can-utils
sudo apt install subversion

ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

###################################################################################################
###I2C settings for LM48100Q-Q1 Boomer™ Mono (adapt i2cset tool)
###################################################################################################
/home/root/i2cset -y 2 0x7c 0x14 #power on
/home/root/i2cset -y 2 0x7c 0x73 #set volume to 0dB (step 20)
/home/root/i2cset -y 2 0x7c 0x75 #set volume to 3dB (step 22)
/home/root/i2cset -y 2 0x7c 0x77 #set volume to 6dB (step 24)
/home/root/i2cset -y 2 0x7c 0x79 #set volume to 9dB (step 26)
/home/root/i2cset -y 2 0x7c 0x7B #set volume to 12dB (step 28)
/home/root/i2cset -y 2 0x7c 0x7D #set volume to 15dB (step 30)
/home/root/i2cset -y 2 0x7c 0x7F #set volume to 18dB (step 32)
/home/root/i2cset -y 2 0x7c 0x24 #reset diagnostic control

###################################################################################################
###ALSA
###################################################################################################
alsamixer
amixer sset 'Headphone' 100%
amixer sset 'PCM' 75%
aplay ding.wav
speaker-test -c 1 -D hw:0 #pink noise
speaker-test -t sine -f 1000 -c 1 -D hw:0

###################################################################################################
###GPIO (example for set up GPIO port for soft poweroff)
###################################################################################################
echo 55 > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio55/direction
echo "falling" > /sys/class/gpio/gpio55/edge

###################################################################################################
###timedatectl / date / hwclock
###################################################################################################
timedatectl set-local-rtc 1 --adjust-system-clock #disable UTC and use local time (for dual boot)
timedatectl set-ntp 0 #disable "timesyncd" network time protocol
timedatectl set-time "yyyy-mm-dd hh:mm" #set time
date -s "yyyy-mm-dd hh:mm" #set time
hwclock -w #set hardware clock (RTC) from system time
hwclock -s #set system time from hardware clock (RTC)

###################################################################################################
###flashing SOM
###################################################################################################
setenv board_name #colibri_imx6_...
run setsdupdate
run update_spl
run update_uboot
reset

env default -a
setenv board_name #colibri_imx6_...
setenv vidargs
setenv fdt_file #imx6dl-colibri_....dtb
saveenv
run setsdupdate
run update

###################################################################################################
###resolve apt update issue caused sometimes behind proxies
###################################################################################################
sudo rm -rf /var/lib/apt/lists/partial
sudo apt-get update -o Acquire::CompressionTypes::Order::=gz

###################################################################################################
###generate dummy sqlite3 database
###################################################################################################
###generate empty database "database.db"
###read "database_create.sql" script for create all tables, views, triggers, indexes
###read "database_10d.sql" script for insert dummy data (takes long time depending on script size)
###################################################################################################
sqlite3 database.db
.read database_create.sql
.read database_10d.sql
.quit

###################################################################################################
###install legacy glade designer 3.8.6
###################################################################################################
###download source from http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/
###extract archive
###read INSTALL doc -> install necessary packages for "make" first
###install libgladeui-1-11_3.8.0-0ubuntu6.1_amd64.deb with dpkg
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
###install googletest
###################################################################################################
sudo apt install libgtest-dev cmake
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib

###################################################################################################
###svn commands
###################################################################################################
svn diff -r PREV:COMMITTED <item>
svn switch ^/trunk
svn switch ^/branches/features/.../
svn merge ^/trunk
svn merge --reintegrate ^/branches/features/... #merge complete branch
svn move ^/branches/features/... ^/branches/features/... #rename branch
svn copy ^/trunk ^/branches/bugfixes/... #create branch/tag
svn copy ^/trunk ^/branches/features/... #create branch/tag
svn copy ^/trunk/.../ ^/tags/... #create branch/tag 
svn delete ^/branches/features/... #delete branch
svn revert --recursive . #revert all
svn status | grep ^! | awk '{print " --force "$2}' | xargs svn rm #delete missing files
svn commit --include-externals
svn resolve --accept mine-conflict -R .
svn resolve --accept their-conflict -R .
svn propset svn:global-ignores "Debug" .
svn propset svn:global-ignores "<binary>" .
svn propdel svn:global-ignores "Debug" .
svn proplist -v -R . | grep svn:ignore
svn propget -R svn:ignore .
svn status
svn info

###################################################################################################
###using gdb for debugging
###################################################################################################
gdbserver host:2345 <app> #start app with gdbserver
gdbserver --attach :2345 `pidof <app>` #attach gdbserver to running app

###################################################################################################
###using gdb for analyse coredumps
###################################################################################################
. /usr/local/oecore_.../environment-setup-armv7at2hf-neon-angstrom-linux-gnueabi
${CROSS_COMPILE}gdb <app> <coredump>
set sysroot /usr/local/oecore_.../sysroots/armv7at2hf-neon-angstrom-linux-gnueabi
info threads
bt full

###################################################################################################
###useful bitbake commands
###################################################################################################
. export
bitbake <target> -c cleansstate
bitbake <target> -c menuconfig
bitbake <target> -c diffconfig
bitbake <target> -f -c compile 
bitbake -k <target>
bitbake <target> -c populate_sdk

###################################################################################################
###u-boot -> prepare for flash os from booting via sftp
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
###u-boot -> remove console tty1 from the boot arguments 
###u-boot -> disable the blinking cursor by adding vt.global_cursor_default=0
###################################################################################################
fw_setenv setup 'setenv setupargs fec_mac=${ethaddr} no_console_suspend=1 vt.global_cursor_default=0 console=${console},${baudrate}n8'

###################################################################################################
###u-boot -> vidargs
###################################################################################################
#MONITOR 
fw_setenv vidargs video=mxcfb0:dev=lcd,EDT-WVGA,if=RGB24
fw_setenv vidargs video=mxcfb0:dev=lcd,800x480M@60,if=RGB24,bpp=24 fbmem=32M

fw_setenv vidargs video=mxcfb0:dev=hdmi,1280x1024M@60,if=RGB24 fbmem=32M

#DISPLAY IN KERNEL
fw_setenv vidargs video=mxcfb0:dev=lcd,ETML1010G0DKA@60,if=RGB24,bpp=24 video=mxcfb1:off fbmem=32M
fw_setenv vidargs video=mxcfb0:dev=lcd,1280x800M@60,if=RGB24 video=mxcfb1:off fbmem=32M

###################################################################################################
###commands for rotating display and touch
###################################################################################################

fbset -t 14064 5 5 18 2 150 3 #set timings for frame buffer device
xinput set-prop 7 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1 #rotate touch 90° left
xinput set-prop 7 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1 #rotate touch 90° right
xinput set-prop 7 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1 #rotate touch 180° inverted
xrandr -o left #rotate display 90° left
xrandr -o right #rotate display 90° right
xrandr -o inverted #rotate display 180° inverted
xrandr --output "DISP3 BG" --scale 1x0.99125 #scale display output  

###################################################################################################
###manually calibrate touch after inverting display
###################################################################################################
###run xinput_calibrator on X startup
###do calibration
###write output text manually to /etc/X11/xorg.conf.d/99-calibration.conf
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
###systemd service -> autologin
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
###systemd service -> start script
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
###systemd service -> start X server
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
