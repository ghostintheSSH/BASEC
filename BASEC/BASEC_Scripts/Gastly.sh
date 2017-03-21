#!/bin/bash

#This script was inspired by the Gibson Research Center's Shields UP!, but interactive
#capability. Shields UP! only reports current port status of open, closed, or hidden and advises
#potential changes if needed and security concerns of said status. This script functions the
#same locally with conducting port scans, but also changes ports to filtered or open based on
#input feedback or can be ignored. 
#Script coded by SSH[ghost].

#Previously known as Cloaks&&Daggers when the script used Aicrack && Metasploit agaitst host
#thus the Daggers part of the name. Now it's just "Cloaks" for hiding the user like as if a ghost


#Scan -- Scan ports of localhost && go to next function OR skip to BASEC function
Gas_Scan() {
	#Calls Color function to change font color
	Colors;
	echo
	#Downloads Gastly ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/092.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Gastly${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}GRC's ShieldsUP!${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Gastly ASCIII art
	cat 092.txt
	#Deletes Gastly ASCII art
	sudo rm -f "$DIR"/092.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e "Would you like to scan your localhost ports? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo -e ${MagentaF}"*Port scan results can be found in a new file created in your home directory"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in 
		[yY])
			echo
			echo -e ${CyanF}"Running basic port scan of localhost..."
			echo -e ${YellowF}
			#Scans opens ports of localhost into 3 files
			nmap -sV -p "*" localhost -oA Gas
			echo
			echo ;;
		[nN])
			#All "Gas_" mentions are calls to specific functions
			Gas_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Gas_Scan ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Gas_Change;
}

#Change -- Change open ports to filtered && go to next function OR skip to BASEC function
Gas_Change() {
	Colors;
	echo -e ${CyanF}"The following section will change the firewall rules"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			clear
			#Retrieves open port numbers from respective file && places them into respective file
			cat Gas.nmap | grep open | cut -d"/" -f1 >> openports.txt
			while read line; do
				echo
				#Changes open port output status to accept
				iptables -A OUTPUT -p tcp -m tcp --dport $line -j ACCEPT
				echo -e ${CyanF}"Port" $line "changed from OPEN to FILTERED"
				#Changes open port input status to accept
				iptables -A INPUT -p tcp -m tcp --dport $line -j DROP
				echo -e ${white}"--------------------------------------------------------------------"
				#Saves firewall rules
				/etc/init.d/iptables-persistent save
				#Restarts firewall
				/etc/init.d/iptables-persistent restart
				echo -e ${RedF}"Processes on Port" $line "must be killed to verify status change"
				echo -e ${white}"--------------------------------------------------------------------"
				echo
			done < openports.txt ;;
		[nN])
			Gas_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Gas_Change ;;
	esac
	#Deletes files created by script
	sudo rm -f "$DIR"/openports.txt && sudo rm -f "$DIR"/Gas.*
	Gas_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Gas_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}57${CyanF}."
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

Gas_Scan
