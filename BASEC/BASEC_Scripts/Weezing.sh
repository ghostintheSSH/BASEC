#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#DisableWireless -- Disables wireless communications commonly used that are insecure due to broadcasting RF waves to everyone within proximity
Meta_DisableWireless() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Weezing ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/110.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Weezing${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Weezing ASCII art
	cat 110.txt
	#Deletes Weezing ASCII art
	sudo rm -f "$DIR"/110.txt
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Weezing${CyanF} is about to disable wireless services commonly used but inherently insecure*"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"*All wireless communications are inherently insecure & Windows Wi-Fi isn't better"
	echo -e ${MagentaF}"The services are ${RedF}Bluetooth${MagentaF} & ${RedF}Wi-Fi${MagentaF}"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Enters quoted line into respective file to kill bluetooth in current session
			sudo echo >> /etc/rc.local "rfkill block bluetooth" 
			#Disables bluetooth
			sudo sed -i.bak 's/^\(InitiallyPowered =\).*/\1false/' /etc/bluetooth/main.conf
			echo -e ${CyanF}"bluetooth disabled"
			echo -en ${YellowF}
			#Enters quoted line into respective file to kill Wi-Fi in current session
			sudo echo >> /etc/network/interfaces "iface wlan0 inet manual"
			#Restarts network-manager for changes to take immediate affect
			sudo service network-manager restart
			echo -e ${CyanF}"wi-fi disabled" ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_DisableWireless ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}46${CyanF}."
	echo -e ${MagentaF}"(${GreenF}B${MagentaF}/${GreenF}P${MagentaF}/${RedF}Q${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[bB])
			#Executes BASEC script
			"$DIR"/BASEC.sh ;;
		[pP])
			"$DIR"/Pokedex.sh ;;
		[qQ])
			clear
			exit ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_BASEC ;;
	esac
}

#Colors -- Contains font color variables for output colors
Colors() {
	Escape="\033";
	white="${Escape}[0m"; 
	RedF="${Escape}[1;49;31m";
	GreenF="${Escape}[1;49;32m";
	YellowF="${Escape}[1;49;33m";
	BlueF="${Escape}[1;49;34m";
	MagentaF="${Escape}[1;49;35m";
	CyanF="${Escape}[1;49;36m";
	Reset="${Escape}[0m";
}

DIR=$(pwd)

Meta_DisableWireless
