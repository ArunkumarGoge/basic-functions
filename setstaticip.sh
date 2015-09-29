#!/bin/bash
#This works only for ubuntu

echo "This script is to configure static or dynamic IP for number of network interfaces. Always run as root."
read -p "How many network interface do you want to configure? :" n

echo auto lo eth0 > ./temp
echo iface lo inet loopback >> ./temp

	for ((i=0; i <n ; i++))
	do
		read -p "Do you want to set static ip or dynamic ip for Interface $((i+1))? static/dynamic:" prompt
		if  [[ $prompt == "static" || $prompt == "Static" || $prompt == "s" || $prompt == "S" ]]
		then

			###############################################################
			#getting input from the user
			###############################################################
			echo "enter the values for Interface$((i+1))"
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
			echo network id is $netip
			echo broadcast ip is $bcip
			echo gateway is $gipcd.

			###############################################################
			#single line to print the content to a file
			###############################################################
			#echo -e "auto lo eth0\niface lo inet loopback\niface eth0 inet static\naddress $ip\nnetmask $subnet\nnetwork $netip\nbroadcast $bcip\ngateway $gip" > /home/goge/network.conf

			###############################################################
			#lines to append the contents to the network file
			###############################################################
			
			echo iface eth$i inet static >> ./temp
			echo address $ip >> ./temp
			echo netmask $subnet >> ./temp
			echo network $netip >> ./temp
			echo broadcast $bcip >> ./temp
			#echo gateway $gip >> ./temp
			echo dns-nameservers 8.8.8.8 >> ./temp

		elif [[ $prompt == "dynamic" || $prompt == "Dynamic" || $prompt == "d" || $prompt == "D" ]]
		then
			echo auto eth$i >> ./temp
			echo iface eth$i inet dhcp >> ./temp
			
		else
			echo "nothing has changed"
			rm ./temp
			exit 1
		fi
	done

##################################################################
#Writting the content to the files
##################################################################
cat temp > /etc/network/interfaces
rm ./temp

###############################################################
#restarting the network services
###############################################################
for ((i=0; i <n ; i++))
do
sudo ifdown eth$i && sudo ifup eth$i
done

echo "one gatway ip need to be defined for any number of interface please edit  /etc/network/interface file and gateway 123.45.67.89 "
