#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#SecureTMP -- Create partition // move /tmp // secure tmp && link /var/tmp to secured /tmp
Meta_SecureTMP() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Machamp ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/068.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Machamp${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Machamp ASCII art
	cat 068.txt
	#Deletes Machamp ASCII art
	sudo rm -f "$DIR"/068.txt
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Machamp${CyanF} needs to secure /tmp & /var/tmp so 1GB partition will need to be created & will take time"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Creates 1GB file system partition
			sudo dd if=/dev/zero of=/usr/tmpDSK bs=1024 count=1024000
			#Creates back-up copy of /tmp
			sudo cp -Rpfv /tmp /tmpbackup
			#Mounts new /tmp partition
			sudo mount -t tmpfs -o loop,noexec,nosuid,rw /usr/tmpDSK /tmp
			#Sets permissions to /tmp partition
			sudo chmod 1777 /tmp
			#Restores /tmp from back-up copy
			sudo cp -Rpf /tmpbackup/* /tmp/
			#Deletes /tmp back-up copy
			sudo rm -rf /tmpbackup/*
			#Adds /tmp partition to fstab to mount during boot-up
			sudo /usr/tmpDSK /tmp tmpfs loop,nosuid,noexec,rw 0 0
			#Tests fstab step
			sudo mount -o remount /tmp
			echo -e ${CyanF}"/tmp partition has been created & secured"
			#Moves /var/tmp to /var/tmpold
			sudo mv /var/tmp /var/tmpold
			#Creates hard link between /var/tmp && /tmp
			sudo ln -s /tmp /var/tmp
			#Copies previous /var/tmp files // subdirectories to /tmp
			sudo cp -prfv /var/tmpold/* /tmp/
			echo -e ${CyanF}"/var/tmp has been moved & secured" ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_SecureTMP ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}37${CyanF}."
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

Meta_SecureTMP
