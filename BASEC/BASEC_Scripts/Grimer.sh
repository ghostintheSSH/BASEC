#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#Disable -- Disable programs not used by news users that would otherwise by avoidable vulnerabilities
Meta_Disable() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Grimer ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/088.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Grimer${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Grimer ASCII art
	cat 088.txt
	#Deletes Grimer ASCII art
	sudo rm -f "$DIR"/088.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Grimer${CyanF} is about to disable services installed not commonly used by new users"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"The services are ${RedF}root account${MagentaF}, ${RedF}shell accounts${MagentaF}, ${RedF}IRQ Balance${MagentaF}, ${RedF}anacron${MagentaF}, ${RedF}compilers${MagentaF}, & ${RedF}ctrl+alt+delete${MagentaF}"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Locks root account
			sudo passwd -l root
			echo -e ${CyanF}"Root account disabled"
			echo -en ${YellowF}
			#Disables IRQ Balance
			sudo sed -i.bak 's/^\(ENABLED=\).*/\10/' /etc/default/irqbalance
			echo -e ${CyanF}"irqbalance balance disabled"
			echo -en ${YellowF}
			#Disables anacron by commenting out lines 11 - 14 of respective file
			sudo sed -i '11,14 s/^/#/' /etc/crontab
			echo -e ${CyanF}"anacron disabled"
			echo -en ${YellowF}
			#Disables compilers by changing permissions to unreadable // unwritable // unexecutable
			sudo chmod 000 /usr/bin/byacc /usr/bin/yacc /usr/bin/bcc /usr/bin/kgcc /usr/bin/cc /usr/bin/gcc /usr/bin/*c++ /usr/bin/*g++
			echo -e ${CyanF}"compilers disabled"
			echo -en ${YellowF}
			#Disables ctrl+alt+delete by commenting out line 12 of respective file
			sudo sed -i '12 s/^/#/' /etc/init/control-alt-delete.conf
			echo -e ${CyanF}"ctrl+alt+delete disabled" ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_Remove ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_Disable ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_Remove
}

#Remove -- Disables && removes (redundancy > vulnerabilities) programs not used by news users that would otherwise by avoidable vulnerabilities
Meta_Remove() {
	Colors;
	echo
	echo -e ${CyanF}"Metapod is about to disable & remove services installed not commonly used by new users."
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"The services are ${RedF}autofs${MagentaF}, ${RedF}nfs-kernel-server${MagentaF}, ${RedF}nfs-common${MagentaF}, ${RedF}portmap${MagentaF}, ${RedF}rpcbind${MagentaF}, ${RedF}apport${MagentaF}, ${RedF}at*${MagentaF}, ${RedF}avahi*${MagentaF}, ${RedF}cups${MagentaF}, ${RedF}dovecot${MagentaF}, ${RedF}snmp${MagentaF}, ${RedF}telnet*${MagentaF}, ${RedF}whoopsie${MagentaF}, & {RedF}zeitgest*${MagentaF}."
	echo
	echo -e ${MagentaF}"Services with * means all services related with the same name"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Enters quoted line into respective file to kill autofs in current session
			sudo echo >> /etc/udev/rules.d/85-no-automount.rules "SUBSYSTEM==\"usb\", ENV{UDISKS_AUTO}=\"0\""
			#Restarts autofs for changes to take immediate affect
			sudo service udev restart
			echo -e ${CyanF}"autofs disabled"
			echo -en ${YellowF}
			sudo echo 'manual' > /etc/init/atd.override
			echo -e ${CyanF}"atd disabled"
			echo -en ${YellowF}
			#Partially removes at
			sudo apt-get purge at
			echo -e ${CyanF}"at* has been removed"
			echo -en ${YellowF}
			sudo cd /etc/init
			#Partially removes zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist
			sudo apt-get purge zeitgeist-core zeitgeist-datahub python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist
			echo -e ${CyanF}"zeitgeist* has been removed" ;;
		[nN])
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_Remove ;;
	esac
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}28${CyanF}."
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

Meta_Disable
