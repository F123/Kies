#!/bin/bash
clear
echo "Detecting Ethernet interface."
/sbin/ifconfig eth0|grep eth0
echo ""
echo "Detecting wireless interface."
/sbin/iwconfig ra0
/opt/kies/bin/kies_show_wifi ra0

echo "verifying hard disk"
/sbin/fdisk -l /dev/sda|grep Disk
echo "Showing image version:"
cat /root/.image_version
echo ""
read -p "Note the information above and then Press enter to continue" wag
echo ""
read -p"Verify that the internal speakers work.  Press enter to start listening" wag
mplayer -really-quiet left.wav 2> /dev/null
read -p "You should have heard speech on the left speaker. Press enter to continue" wag
mplayer -really-quiet right.wav 2> /dev/null
read -p "You should have heard speech on the right speaker. Press enter to continue" wag
 echo ""
 echo "Plug headphones into the headphone jack"
 read -p"Verify that the headphones work and that the speakers is silent.  Press enter to start listening" wag
mplayer -really-quiet left.wav 2> /dev/null
read -p "You should have heard speech in your left ear. Press enter to continue" wag
mplayer -really-quiet right.wav 2> /dev/null
read -p "You should have heard speech in your right ear. Press enter to continue" wag
 echo ""
 echo "Please plug external speakers into the lineout jack."
read -p"Verify that the lineout jack work.  Press enter to start listening" wag
mplayer -really-quiet left.wav 2> /dev/null
read -p "You should have heard speech on the left speaker. Press enter to continue" wag
mplayer -really-quiet right.wav 2> /dev/null
read -p "You should have heard speech on the right speaker. Press enter to continue" wag
 echo ""
 
 test -e testme.wav&&rm testme.wav
read -p"Speak into first the left, and then the right microphone. You have 10 seconds.  Press enter to start. " wag
 /opt/kies/bin/ecasound -q -i alsa -o testme.wav -t:10
 read -p"Now verify that the recording worked. Press enter to listen." wag
 mplayer -really-quiet testme.wav 2> /dev/null
 echo ""
echo "Please plug an external microphone into the microphone jack." 
echo "While doing this test, touch the internal microphones, thereby checking that they are inactive."
 test -e testme.wav&&rm testme.wav
read -p"Speak into the external  microphone. You have 10 seconds.  Press enter to start. " wag
 /opt/kies/bin/ecasound -q -i alsa -o testme.wav -t:10
 read -p"Now verify that the recording worked. Press enter to listen." wag
 mplayer -really-quiet testme.wav 2> /dev/null
 echo ""
read -p"Please plug a memory stick into the far right USB port at the back and press enter" wag
sleep 5
/sbin/fdisk -l /dev/sdb|grep Disk
read -p"hardware verification completed. Press enter." wag
 
 
