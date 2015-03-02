#!/bin/bash


read -p "Do you want to set static ip? yes/no:" prompt
if  [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then

##############################################################
#getting input from the user
###############################################################
read -p "enter the ip address:" ip
read -p "enter the subnet ip:" subnet
read -p "enter the network ip:" netip
read -p "enter the broadcast ip:" bcip
read -p "enter the gateway ip:" gip




###############################################################
#printing in the Terminal
################################################################

echo ip is $ip
echo subnet is $subnet
echo network ip is $netip
echo broadcast ip is $bcip
echo gateway is $gip





###############################################################
#single line to print the content to a file
###############################################################

#echo -e "auto lo eth0\niface lo inet loopback\niface eth0 inet static\naddress $ip\nnetmask $subnet\nnetwork $netip\nbroadcast $bcip\ngateway $gip" > /home/goge/network.conf




###############################################################
#lines to append the contents to the network file
###############################################################

echo auto lo eth0 > /home/goge/network.conf
echo iface lo inet loopback >> /home/goge/network.conf
echo iface eth0 inet static >> /home/goge/network.conf
echo address $ip >> /home/goge/network.conf
echo netmask $subnet >> /home/goge/network.conf
echo network $netip >> /home/goge/network.conf
echo broadcast $bcip >> /home/goge/network.conf
echo gateway $gip>> /home/goge/network.conf



else
echo "nothing has changed"
fi
