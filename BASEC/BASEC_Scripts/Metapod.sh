#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#Main -- Conduct updates // upgrades && go to next function OR skip to next function
Meta_Update() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Metapod ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/011.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Metapod${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"${white}
	#Displays Metapod ASCII art
	cat 011.txt
	#Deletes Metapod ASCII art
	sudo rm -f "$DIR"/011.txt
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e "First step is confirming the system is up-to-date - "${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Updates && accepts updates without further input
			sudo apt-get update && sudo apt-get -y upgrade
			#Installs both to download // install security updates automatically
			sudo apt-get -y install unattended-upgrades apt-listchanges
			#Creates /etc/apt/apt.conf.d/20auto-upgrades to activate unattended upgrades
			sudo dpkg-reconfigure -plow unattended-upgrades ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_InstallAPT ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_Update ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_InstallAPT
}

#InstallAPT -- Conduct installations && go to next function OR skip to next function
Meta_InstallAPT() {
	Colors;
	echo
	echo -e ${CyanF}"Metapod needs to verify needed programs are installed"
	echo -en ${YellowF}
	#Installs needed security programs && without user input (would be unnecessary issue to deny installations)
	sudo apt-get install -y iptables iptables-persistent ufw gufw nmap fail2ban chkrootkit clamav* clamtk gnupg rkhunter openssh-server knockd
	Meta_Secure
}

#Secure -- Tighten security // deny access && go to next function OR skip to next function
Meta_Secure() {
	Colors;
	echo
	echo -e ${CyanF}"Metapod needs to secure system"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Limits su use to users in sudo group
			sudo dpkg-statoverride --update --add root sudo 4750 /bin/su
			echo -e ${CyanF}"Su access limited to user"
			echo -en ${YellowF}
			#Comments out lines 30 - 401 so that affected TTY consoles are not usable
			sudo sed -i '30,401 s/^/#/' /etc/securetty
			echo -e ${CyanF}"All TTY consoles disabled, excluding TTY1"
			echo -en ${YellowF}
			#Alters previous TTY config so own root has access // ability to change config
			sudo chown root:root /etc/securetty
			sudo chmod 0600 /etc/securetty
			echo -e ${CyanF}"TTY console security configuration restricted to root access"
			echo -en ${YellowF}
			#Secures shared memory so it can be used against running service(s) by intruder
			sudo echo >> /etc/fstab "#secure shared memory
			tmpfs     /run/shm    tmpfs	defaults,noexec,nosuid	0	0"
			#Alternative to rebooting for immediate effect in current session
			sudo mount -a
			echo -e ${CyanF}"Shared Memory secured"
			echo -en ${YellowF}
			#Denies all users from Cronjobs access
			sudo echo ALL >> /etc/cron.deny
			echo -e ${CyanF}"Cronjobs restricted for ALL users. User addition to follow."
			echo -en ${YellowF}
			#Denies all IP addresses from SSH access
			sudo echo >> /etc/hosts.deny "sshd : ALL"
			echo -e ${CyanF}"SSH restricted for ALL IP addresses. IP Address addition to follow." ;;
		[nN])
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_Secure ;;
	esac
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}23${CyanF}."
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

Meta_Update
