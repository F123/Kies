#!/bin/bash
#when an image of a running linux is moved to a new box,
#udev sets up the eth0 as eth1 because the mac addresses are different.
#This script takes out the old eth0 entry and corrects the new one to again point to eth0

sed -i /eth0/d /etc/udev/rules.d/70-persistent-net.rules
sed -i s'/eth1/eth0/'g /etc/udev/rules.d/70-persistent-net.rules
