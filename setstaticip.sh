#!/bin/bash
#This works only for ubuntu



	read -p "Do you want to set static ip or dynamic ip? static/dynamic:" prompt
	if  [[ $prompt == "static" || $prompt == "Static" || $prompt == "s" || $prompt == "S" ]]
	then

		###############################################################
		#getting input from the user
		###############################################################
		read -p "enter the ip address:" ip
		read -p "enter the subnet mask:" subnet
		read -p "enter the network ip:" netip
		read -p "enter the broadcast ip:" bcip
		read -p "enter the gateway ip:" gip

		###############################################################
		#printing in the Terminal
		################################################################
		echo ip is $ip
		echo subnet mask is $subnet
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
		echo auto lo eth0 > /etc/network/interfaces
		echo iface lo inet loopback >> /etc/network/interfaces
		echo iface eth0 inet static >> /etc/network/interfaces
		echo address $ip >> /etc/network/interfaces
		echo netmask $subnet >> /etc/network/interfaces
		echo network $netip >> /etc/network/interfaces
		echo broadcast $bcip >> /etc/network/interfaces
		echo gateway $gip >> /etc/network/interfaces
		echo dns-nameservers 8.8.8.8 >> /etc/network/interfaces

		###############################################################
		#restarting the network services
		###############################################################
		sudo ifdown eth0 && sudo ifup eth0

	elif [[ $prompt == "dynamic" || $prompt == "Dynamic" || $prompt == "d" || $prompt == "D"]]
	then
		echo auto lo eth0 > /etc/network/interfaces
		echo iface lo inet loopback >> /etc/network/interfaces
		echo auto eth0 >> /etc/network/interfaces
		echo iface eth0 inet dhcp >> /etc/network/interfaces
		sudo ifdown eth0 && sudo ifup eth0

	else
		echo "nothing has changed"
	fi

	

