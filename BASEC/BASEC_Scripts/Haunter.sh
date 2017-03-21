#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#Cron -- Switch for going to function CronAllow or back to BASEC or Pokedex
Meta_Cron() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Haunter ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/093.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Haunter${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Haunter ASCII art
	cat 093.txt
	#Deletes Haunter ASCII art
	sudo rm -f "$DIR"/093.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${CyanF}"Do you want to add user access to Cronjobs? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			#All "Meta_" mentions are calls to specific functions
			Meta_CronAllow ;;
		[nN])
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_Cron ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
}

#CronAllow -- Allows specified username Cron access && goes to function Cron
Meta_CronAllow() {
	Colors;
	echo
	echo -e ${CyanF}"Enter the username you want to permit Cronjobs access"
	echo
	echo -en ${GreenF}"Username: "${white}
	read OPTION

	echo -en ${YellowF}
	#Permits entered username Cronjobs access
	sudo echo -e $OPTION >> /etc/cron.allow
	echo -e ${CyanF} $OPTION " has been permitted Cronjobs access"${white}
	Meta_Cron
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}25${CyanF}."
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

Meta_Cron
