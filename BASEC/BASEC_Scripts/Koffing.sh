#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#Main -- Conduct updates // upgrades && go to next function OR skip to next function
Meta_DisableSpies() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Koffing ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/109.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Koffing${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Koffing ASCII art
	cat 109.txt
	#Deletes Koffing ASCII art
	sudo rm -f "$DIR"/109.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Koffing${CyanF} is about to disable webcam & mute microphone"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"Microphone can't be disabled without disabling entire soundcard"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Disables webcam for current session
			sudo modprobe -r uvcvideo
			echo -e ${CyanF}"Webcam disabled for this session only"
			echo -en ${YellowF}
			#Adds webcam functionality to blacklist
			sudo echo >> /etc/modprobe.d/blacklist.conf "

#Disables webcam
blacklist uvcvideo"
			echo -e ${CyanF}"Webcam disabled for future sessions"
			echo -en ${YellowF}
			#Mutes microphone
			amixer set Capture nocap
			echo -e ${CyanF}"Microphone muted" ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_DisableSpies ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}31${CyanF}."
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

Meta_DisableSpies
