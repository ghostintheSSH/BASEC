#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#Remove -- Disables && removes (redundancy > vulnerabilities) programs not used by news users that would otherwise by avoidable vulnerabilities
Meta_RemoveW() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Muk ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/089.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Muk${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Muk ASCII art
	cat 089.txt
	#Deletes Muk ASCII art
	sudo rm -f "$DIR"/089.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Muk${CyanF} is about to disable & remove network services installed not commonly used by new users"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"The services are ${RedF}autofs${MagentaF}, ${RedF}nfs-kernel-server${MagentaF}, ${RedF}nfs-common${MagentaF}, ${RedF}portmap${MagentaF}, ${RedF}rpcbind${MagentaF}, ${RedF}apport${MagentaF}, ${RedF}at*${MagentaF}, ${RedF}avahi*${MagentaF}, ${RedF}cups${MagentaF}, ${RedF}dovecot${MagentaF}, ${RedF}snmp${MagentaF}, ${RedF}telnet*${MagentaF}, ${RedF}whoopsie${MagentaF}, & ${RedF}zeitgest*${MagentaF}"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Partially removes nfs-kernel-server nfs-common portmap rpcbind autofs
			sudo apt-get purge nfs-kernel-server nfs-common portmap rpcbind autofs
			echo -e ${CyanF}"nfs-kernel-server, nfs-common, portmap, rpcbind, & autofs have been removed"
			echo -en ${YellowF}
			#Disables Apport
			sudo sed -i.bak 's/^\(ENABLED=\).*/\10/' /etc/default/apport
			echo -e ${CyanF}"apport disabled"
			echo -en ${YellowF}
			#Partially removes apport
			sudo apt-get purge apport
			echo -e ${CyanF}"apport has been removed"
			echo -en ${YellowF}
			#Adds 'manual' to respective file to disable atd
			#Creates ovveride file for avahi
			sudo touch avahi-daemon.override
			#Adds 'manual' to respective file to disable avahi
			sudo echo -e "manual" > avahi-daemon.override
			echo -e ${CyanF}"avahi disabled"
			echo -en ${YellowF}
			#Partially removes avahi-daemon avahi-utils
			sudo apt-get -y remove avahi-daemon avahi-utils
			echo -e ${CyanF}"avahi* has been removed"
			echo -en ${YellowF}
			#Adds 'manual' to respective file to disable cups
			sudo echo -e "manual" > /etc/init/cups.override
			echo -e ${CyanF}"cups disabled"
			echo -en ${YellowF}
			#Partially removes cups
			sudo apt-get -y remove cups
			echo -e ${CyanF}"cups has been removed"
			echo -en ${YellowF}
			#Partially removes dovecot
			sudo apt-get purge dovecot-*
			echo -e ${CyanF}"dovecot has been removed"
			echo -en ${YellowF}
			#Fully removes snmp
			sudo apt-get purge --auto-remove snmp
			echo -e ${CyanF}"snmp has been removed"
			echo -en ${YellowF}
			#Partially removes telnetd inetutils-telnetd telnetd-ssl
			sudo apt-get purge telnetd inetutils-telnetd telnetd-ssl
			echo -e ${CyanF}"telnet* has been removed"
			echo -en ${YellowF}
			#Disables whoopsie
			sudo sed -i.bak 's/^\(report_crashes=\).*/\1false/' /etc/default/whoopsie
			echo -e ${CyanF}"whoopsie disabled"
			echo -en ${YellowF}
			#Partially removes whoopsie
			sudo apt-get purge whoopsie
			echo -e ${CyanF}"whoopsie has been removed"
			echo -en ${YellowF} ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_RemoveW ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}44${CyanF}."
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

Meta_RemoveW
