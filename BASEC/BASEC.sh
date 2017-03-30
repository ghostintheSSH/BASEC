#!/bin/bash

#This script was created so that the user can learn about security and implement it
#simultaneously. The entire purpose of BASEC is sitting in this script whereas the quick-
#reference and quick-use alternatives are just that: quick alternatives. BASEC is meant to
#be an interactive security guide and BASEC.sh and the Pokemon scripts accomplish this feat.
#Script coded by SSH[ghost]


#Update -- Updates the system
BASEC_Update() {
	#Calls Color function to change font color
	Colors;
	echo
	echo -e ${CyanF}"Before we run BASEC, we need to confirm the system is up-to-date."
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -e ${YellowF}
			#Updates the system
			sudo apt-get update && sudo apt-get -y upgrade ;;
		[nN])
			#Calls the next function
			BASEC_Install ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			BASEC_Update ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	BASEC_Install
}

#Install -- Installs tools needed to run BASEC
BASEC_Install() {
	Colors;
	echo
	echo -e ${CyanF}"Second, we need to is install tools needed to run BASEC."
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -e ${YellowF}
			#Installs tools needed to run BASEC
			sudo apt-get install -y git autotools-dev automake uuid-dev zlib1g-dev gcc make autoconf pkg-config iptables iptables-persistent ufw gufw feh nmap fail2ban chkrootkit clamav* clamtk gnupg rkhunter openssh-server knockd menu ;;
		[nN])
			clear
			echo -e ${RedF}"We can't run BASEC without these tools"
			#Exits BASEC so the guide won't break throughout its use
			exit ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			BASEC_Install ;;
	esac
	Page0
}

#Title -- Displays the title page
Page0() {
	Colors;
	PAGE=0
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo -e ${white}" "
	#Downloads Gengar ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/094.txt
	clear
	echo -e ${white}" "
	#Displays Gengar ASCII art
	cat 094.txt
	#Deletes Gengar ASCII art
	sudo rm -f "$DIR"/094.txt
	echo
	echo
	echo
	echo -e ${CyanF}"Welcome to ${YellowF}BASEC${CyanF} - ${MagentaF}SSH[ghost]${CyanF} Basic Security Guide for new, *nix users"
	echo
	
	echo -e ${white}"PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page1() {
	Colors;
	PAGE=1
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	#Retrieves and displays guide pages
	more -d "$DIR"/BASEC_Pages/Page01.txt
	#navbar control to use the script
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page2() {
	Colors;
	PAGE=2
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page02.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page3() {
	Colors;
	PAGE=3
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo -e ${white}" "
	echo -e ${RedF}"TABLE OF CONTENTS"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo
	echo -e ${CyanF}"Page${RedF} 01${MagentaF} - About Book                                        ${CyanF}Page${RedF} 41${MagentaF} - ${BlueF}Project Mobile"
	echo -e ${CyanF}"Page${RedF} 02${MagentaF} - About Author                                      ${CyanF}Page${RedF} 42${MagentaF} - ${RedF}NETSEC"
	echo -e ${CyanF}"Page${RedF} 03${MagentaF} - ${BlueF}Table of Contents                                 ${CyanF}Page${RedF} 43${MagentaF} - Execute Muk.sh"
	echo -e ${CyanF}"Page${RedF} 04${MagentaF} - ${RedF}PERSEC                                            ${CyanF}Page${RedF} 44${MagentaF} - ${GreenF}Networking"
	echo -e ${CyanF}"Page${RedF} 05${MagentaF} - ${GreenF}Online Identity                                   ${CyanF}Page${RedF} 45${MagentaF} - Execute Muk.sh"
	echo -e ${CyanF}"Page${RedF} 06${MagentaF} - ${GreenF}Account Maintenance / PII Requirements            ${CyanF}Page${RedF} 46${MagentaF} - ${BlueF}Project HoneyNet"
	echo -e ${CyanF}"Page${RedF} 07${MagentaF} - ${GreenF}Email                                             ${CyanF}Page${RedF} 47${MagentaF} - ${GreenF}Browsers"
	echo -e ${CyanF}"Page${RedF} 08${MagentaF} - ${GreenF}Privacy Maintenance                               ${CyanF}Page${RedF} 48${MagentaF} - ${GreenF}Email"
	echo -e ${CyanF}"Page${RedF} 09${MagentaF} - ${YellowF}Download & Install EXIFTool                       ${CyanF}Page${RedF} 49${MagentaF} - ${GreenF}Chat"
	echo -e ${CyanF}"Page${RedF} 10${MagentaF} - ${GreenF}Passwords                                         ${CyanF}Page${RedF} 50${MagentaF} - ${GreenF}Firewall"
	echo -e ${CyanF}"Page${RedF} 11${MagentaF} - ${YellowF}Download & Install pwd.sh                         ${CyanF}Page${RedF} 51${MagentaF} - Execute Charizard.sh"
	echo -e ${CyanF}"Page${RedF} 12${MagentaF} - ${GreenF}Two-Factor Authentication                         ${CyanF}Page${RedF} 52${MagentaF} - ${GreenF}Cloud"
	echo -e ${CyanF}"Page${RedF} 13${MagentaF} - ${GreenF}Virtualization                                    ${CyanF}Page${RedF} 53${MagentaF} - Execute Cloyster.sh"
	echo -e ${CyanF}"Page${RedF} 14${MagentaF} - ${BlueF}Project Device PerSec                             ${CyanF}Page${RedF} 54${MagentaF} - ${YellowF}Download & Install Sync"
	echo -e ${CyanF}"Page${RedF} 15${MagentaF} - ${GreenF}Finances                                          ${CyanF}Page${RedF} 55${MagentaF} - ${GreenF}VPN"
	echo -e ${CyanF}"Page${RedF} 16${MagentaF} - ${GreenF}Full Disk Encryption                              ${CyanF}Page${RedF} 56${MagentaF} - Execute Gastly.sh"
	echo -e ${CyanF}"Page${RedF} 17${MagentaF} - ${GreenF}Partition Encryption                              ${CyanF}Page${RedF} 57${MagentaF} - ${YellowF}Download & Install DNSCrypt"
	echo -e ${CyanF}"Page${RedF} 18${MagentaF} - ${YellowF}Download & Install Veracrypt                      ${CyanF}Page${RedF} 58${MagentaF} - ${GreenF}Tor"
	echo -e ${CyanF}"Page${RedF} 19${MagentaF} - ${GreenF}File Encryption                                   ${CyanF}Page${RedF} 59${MagentaF} - ${YellowF}Download & Install Tor"
	echo -e ${CyanF}"Page${RedF} 20${MagentaF} - ${YellowF}Download & Install AESCrypt                       ${CyanF}Page${RedF} 60${MagentaF} - ${GreenF}IDS / IPS"
	echo -e ${CyanF}"Page${RedF} 21${MagentaF} - ${RedF}SYSSEC                                            ${CyanF}Page${RedF} 61${MagentaF} - ${BlueF}Project pIDS"
	echo -e ${CyanF}"Page${RedF} 22${MagentaF} - Execute Metapod.sh                                ${CyanF}Page${RedF} 62${MagentaF} - ${RedF}FUTURE ADDITIONS"	
	echo -e ${CyanF}"Page${RedF} 23${MagentaF} - ${GreenF}Automation                                        ${CyanF}Page${RedF} 63${MagentaF} - ${BlueF}Project Windows installation"
	echo -e ${CyanF}"Page${RedF} 24${MagentaF} - Execute Haunter.sh                                ${CyanF}Page${RedF} 64${MagentaF} - ${BlueF}Project Linux installation"
	echo -e ${CyanF}"Page${RedF} 25${MagentaF} - ${YellowF}Download & Install Netdata                        ${CyanF}Page${RedF} 65${MagentaF} - ${BlueF}Project TelemeNet"
	echo -e ${CyanF}"Page${RedF} 26${MagentaF} - ${GreenF}Maintenance"
	echo -e ${CyanF}"Page${RedF} 27${MagentaF} - Execute Grimer.sh"
	echo -e ${CyanF}"Page${RedF} 28${MagentaF} - ${YellowF}Download & Install Bleachbit"
	echo -e ${CyanF}"Page${RedF} 29${MagentaF} - ${GreenF}Physical Security"
	echo -e ${CyanF}"Page${RedF} 30${MagentaF} - Execute Koffing.sh"
	echo -e ${CyanF}"Page${RedF} 31${MagentaF} - ${BlueF}Project HoneyDrive"
	echo -e ${CyanF}"Page${RedF} 32${MagentaF} - ${BlueF}Project RFID-GPS"
	echo -e ${CyanF}"Page${RedF} 33${MagentaF} - ${GreenF}Anti-Malware"
	echo -e ${CyanF}"Page${RedF} 34${MagentaF} - ${GreenF}Operating Systems"
	echo -e ${CyanF}"Page${RedF} 35${MagentaF} - ${GreenF}Popular Linux"
	echo -e ${CyanF}"Page${RedF} 36${MagentaF} - Execute Machamp.sh"	
	echo -e ${CyanF}"Page${RedF} 37${MagentaF} - ${GreenF}Other Linux"
	echo -e ${CyanF}"Page${RedF} 38${MagentaF} - ${BlueF}Project USB"
	echo -e ${CyanF}"Page${RedF} 39${MagentaF} - ${GreenF}Phones"
	echo -e ${CyanF}"Page${RedF} 40${MagentaF} - ${GreenF}Android"${white}
	echo
	echo
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page4() {
	Colors;
	PAGE=4
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page04.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page5() {
	Colors;
	PAGE=5
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page05.txt
	#Displays photos relevant to page
	feh -g 800x600 "$DIR"/BASEC_Photos/pg05*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page6() {
	Colors;
	PAGE=6
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page06.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg06*
	
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page7() {
	Colors;
	PAGE=7
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page07.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg07*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page8() {
	Colors;
	PAGE=8
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page08.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg08*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#EXIF -- downloads && installs EXIFTool
Page9() {
	Colors;
	PAGE=9
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install EXIFTool? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			wget http://www.sno.phy.queensu.ca/~phil/exiftool/Image-ExifTool-10.17.tar.gz
			tar -xvf Image-ExifTool-10.17.tar.gz
			cd Image-ExifTool-10.17
			#Executes Perl script
			perl Makefile.PL 
			#Makes file
			make 
			#Test Make
			make test
			#Installs file
			sudo make install
			cd ~/
			sudo rm -f Image-ExifTool-10.17.tar.gz Image-ExifTool-10.17
			echo -e ${CyanF}"EXIFTool installed"
			echo -e "Execute with the following command: ${GreenF}exiftool" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page9 ;;
	esac

	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page10() {
	Colors;
	PAGE=10
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page10.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg10*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#pwd -- downloads && installs pwd.sh
Page11() {
	Colors;
	PAGE=11
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install pwd.sh? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Installs GnuPG
			sudo apt-get install -y gnupg
			#Clones github project
			git clone https://github.com/drduh/pwd.sh
			#Moves script out of folder
			mv "$DIR"/pwd.sh/pwd.sh "$DIR"/Downloads
			#Deletes folder && contents
			rm -rf "$DIR"/pwd.sh
			#Moves script to home folder
			mv "$DIR"/Downloads/pwd.sh "$DIR"/
			echo -e ${CyanF}"pwd.sh installed"
			echo -e "Execute with the following command: ${GreenF}./pwd.sh" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page11 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page12() {
	Colors;
	PAGE=12
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page12.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg12*
	
	echo "PAGE: "$PAGE
	echo 	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page13() {
	Colors;
	PAGE=13
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page13.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg13*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page14() {
	Colors;
	PAGE=14
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_DevicePerSec.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/01_ProjectDevicePerSec.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page15() {
	Colors;
	PAGE=15
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page15.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg15*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page16() {
	Colors;
	PAGE=16
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page16.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg16*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page17() {
	Colors;
	PAGE=17
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page17.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg17*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Veracrypt -- downloads && installs Veracrypt
Page18() {
	Colors;
	PAGE=18
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install Veracrypt? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			wget https://sourceforge.net/projects/veracrypt/files/VeraCrypt%201.17/veracrypt-1.17-setup.tar.bz2
			tar -xvf veracrypt-1.17-setup.tar.bz2
			chmod +x veracrypt-1.17-setup-gui-x64
			sudo ./veracrypt-1.17-setup-gui-x64
			sudo rm -f veracrypt-1.17-setup.tar.bz2 veracrypt-1.17-setup-console-x64 veracrypt-1.17-setup-console-x86 veracrypt-1.17-setup-gui-x64 veracrypt-1.17-setup-gui-x86
			echo -e ${CyanF}"Veracrypt installed" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page18 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page19() {
	Colors;
	PAGE=19
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page19.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg19*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#AEScrypt -- downloads && installs AES Crypt
Page20() {
	Colors;
	PAGE=20
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install AES Crypt? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			wget https://www.aescrypt.com/download/v3/linux/AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz
			#Extracts tarball
			tar -xvf AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz
			#Changes script to executable
			chmod +x AESCrypt-GUI-3.10-Linux-x86_64-Install
			sudo ./AESCrypt-GUI-3.10-Linux-x86_64-Install
			sudo rm -f AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz AESCrypt-GUI-3.10-Linux-x86_64-Install
			echo -e ${CyanF}"AEScrypt installed" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page20 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page21() {
	Colors;
	PAGE=21
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page21.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg21*
	
	echo "PAGE: "$PAGE
	echo	
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Metapod -- executes Metapod script
Page22() {
	Colors;
	PAGE=22
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Metapod${CyanF} - system hardening script"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Metapod.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page22 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page23() {
	Colors;
	PAGE=23
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page23.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg23*
	
	echo "PAGE: "$PAGE
	echo	
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Haunter -- executes Haunter script
Page24() {
	Colors;
	PAGE=24
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Haunter${CyanF} - permits user Cron access"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Haunter.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page24 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo	
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Netdata -- downloads && installs Netdata
Page25() {
	Colors;
	PAGE=25
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install Netdata? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			git clone https://github.com/firehol/netdata.git --depth=1
			cd netdata
			sudo ./netdata-installer.sh
			sudo rm -f "$DIR"/netdata
			echo -e ${CyanF}"Netdata installed"
			echo -e "Execute with the following command: ${GreenF}netdata" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page25 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo	
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page26() {
	Colors;
	PAGE=26
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page26.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg26*
	
	echo "PAGE: "$PAGE
	echo	
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Grimer -- disables & removes local tools not commonly use
Page27() {
	Colors;
	PAGE=27
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Grimer${CyanF} - disables & removes local tools not commonly used"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Grimer.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page27 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Bleachbit -- downloads && installs Bleachbit
Page28() {
	Colors;
	PAGE=28
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install Bleachbit? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Installs menu dependency
			sudo apt-get install -y menu
			#Downloads package
			wget http://katana.oooninja.com/bleachbit/sf/bleachbit_1.8_all_ubuntu1404.deb
			#Installs package
			sudo dpkg -i bleachbit_1.8_all_ubuntu1404.deb
			#Deletes package
			sudo rm -f bleachbit_1.8_all_ubuntu1404.deb
			echo -e ${CyanF}"Bleachbit installed" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page28 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page29() {
	Colors;
	PAGE=29
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page29.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg29*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Koffing -- disables webcam & mutes microphone
Page30() {
	Colors;
	PAGE=30
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Koffing${CyanF} - disables webcam & mutes microphone"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Koffing.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page30 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page31() {
	Colors;
	PAGE=31
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_HoneyDrive.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/03_ProjectHoneyDrive.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page32() {
	Colors;
	PAGE=32
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_RFID-GPS.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/04_ProjectRFID-GPS.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page33() {
	Colors;
	PAGE=33
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page33.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg33*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page34() {
	Colors;
	PAGE=34
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page34.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page35() {
	Colors;
	PAGE=35
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page35.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg35*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Machamp -- creates new, secure partition & moves /tmp to it
Page36() {
	Colors;
	PAGE=36
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Machamp${CyanF} - creates new partition to move & secure /tmp"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Machamp.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page36 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page37() {
	Colors;
	PAGE=37
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page37.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg37*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page38() {
	Colors;
	PAGE=38
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_USB.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/06_ProjectUSB.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page39() {
	Colors;
	PAGE=39
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page39.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg39*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page40() {
	Colors;
	PAGE=40
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page40.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg40*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page41() {
	Colors;
	PAGE=41
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_Mobile.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page42() {
	Colors;
	PAGE=42
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page42.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Muk -- disables & removes network tools not commonly used
Page43() {
	Colors;
	PAGE=43
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Muk${CyanF} - disables & removes network tools not commonly used"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Muk.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page43 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page44() {
	Colors;
	PAGE=44
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page44.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg44*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Weezing -- disables Wi-Fi & Bluetooth
Page45() {
	Colors;
	PAGE=45
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Weezing${CyanF} - disables Wi-Fi & Bluetooth"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Weezing.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page45 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page46() {
	Colors;
	PAGE=46
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_HoneyNet.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/02_ProjectHoneyNet.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page47() {
	Colors;
	PAGE=47
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page47.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg47*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page48() {
	Colors;
	PAGE=48
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page48.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg48*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page49() {
	Colors;
	PAGE=49
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page49.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page50() {
	Colors;
	PAGE=50
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page50.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg50*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Charizard -- secures firewall
Page51() {
	Colors;
	PAGE=51
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Charizard${CyanF} - secures firewall"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Charizard.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page51 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page52() {
	Colors;
	PAGE=52
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page52.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg52*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Cloyster -- secures SSH
Page53() {
	Colors;
	PAGE=53
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Cloyster${CyanF} - secures SSH"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Cloyster.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page53 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Sync -- downloads && installs BitTorrent Sync
Page54() {
	Colors;
	PAGE=54
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install BitTorrent Sync? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			wget https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
			tar -xvf BitTorrent-Sync_x64.tar.gz
			sudo rm -f BitTorrent-Sync_x64.tar.gz LICENSE.TXT README
			echo -e ${CyanF}"BitTorrent Sync installed"
			echo -e "Execute with the following command: ${GreenF}./btsync" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page54 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page55() {
	Colors;
	PAGE=55
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page55.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg55*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Gastly -- filters open firewall ports
Page56() {
	Colors;
	PAGE=56
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${YellowF}"BASEC${CyanF} is going to run ${YellowF}Gastly${CyanF} - filters open firewall ports"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			"$DIR"/BASEC_Scripts/Gastly.sh ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page56 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#DNS -- downloads && installs DNSCrypt
Page57() {
	Colors;
	PAGE=57
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install DNSCrypt? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			sudo add-apt-repository ppa:anton+/dnscrypt
			sudo apt-get update
			sudo apt-get install -y dnscrypt-proxy
			echo -e ${CyanF}"DNScrypt installed"
			echo -e "Execute with the following command: ${GreenF}dnscrypt-proxy" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page57 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page58() {
	Colors;
	PAGE=58
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page58.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg58*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

#Tor -- downloads && installs Tor
Page59() {
	Colors;
	PAGE=59
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	echo
	echo -e ${CyanF}"Would you like to install Tor? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Adds Tor repository
			sudo add-apt-repository ppa:webupd8team/tor-browser
			#Updates system for installation
			sudo apt-get update
			sudo apt-get install -y tor-browser
			echo -e ${CyanF}"Tor installed" ;;
		[nN])
			echo ;;
		*)
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			Page59 ;;
	esac
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page60() {
	Colors;
	PAGE=60
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page60.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/pg60*
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page61() {
	Colors;
	PAGE=61
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_pIDS.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/07_ProjectpIDS.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page62() {
	Colors;
	PAGE=62
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Page62.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page63() {
	Colors;
	PAGE=63
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_WindowsInstallation.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page64() {
	Colors;
	PAGE=64
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_LinuxInstallation.txt
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page65() {
	Colors;
	PAGE=65
	INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"
	clear
	more -d "$DIR"/BASEC_Pages/Project_TelemeNet.txt
	feh -g 800x600 "$DIR"/BASEC_Photos/08_ProjectTelemeNet.png
	
	echo "PAGE: "$PAGE
	echo
	echo -en $INFO ${GreenF}"Option: "${white}
	read OPTION
	export $PAGE && export $OPTION
	Pager $OPTION
}

Page66() {
	Colors;
	clear
	echo -e ${CyanF}"You've now finished learning the basics of cyber security and given yourself the basic system hardening needed to secure your system."
	echo -e "Don't forget that all of this means nothing if you don't uphold PERSEC. You are your biggest security vulnerability!"
	echo
	echo -e ${GreenF}"Thank you for using BASEC and adding to the cyber security herd immunity! Browse safely." 
	echo -e ${MagentaF}"SSH[ghost]"
	echo
	exit
}

Pager() {
	if [ $OPTION -eq $OPTION 2>/dev/null ]; then
		OPTION=$((OPTION + 0))
		Page$OPTION
	else
		if [ "$OPTION" = "+" ]; then
			((PAGE++))
			Page$PAGE
		elif [ "$OPTION" = "-" ]; then
			((PAGE--))
			Page$PAGE
		elif [[ "$OPTION" = "t" || "$OPTION" = "T" ]]; then
			Page3
		elif [[ "$OPTION" = "q" || "$OPTION" = "Q" ]]; then
			clear
			exit
		else
			echo -e ${RedF}"That's not an option. Starting next page."${white}
			sleep 3s
			((PAGE++))
			Page$PAGE
		fi
	fi
}

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
INFO="${MagentaF}Table of Contents (${CyanF}T${MagentaF}) ${RedF}| ${MagentaF}Page Jump (${CyanF}##${MagentaF}) ${RedF}| ${MagentaF}Next Page (${CyanF}+${MagentaF}) ${RedF}| ${MagentaF}Last Page (${CyanF}-${MagentaF}) ${RedF}| ${MagentaF}Quit (${CyanF}Q${MagentaF}) ${RedF}|"

BASEC_Update
