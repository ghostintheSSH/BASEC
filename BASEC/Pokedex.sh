#!/bin/bash

#This script was created as an alternative for BASEC for experienced BASEC users that
#want the functionality of the script system without having to use the guide. It quickens
#system hardening for new installations in a quick & organized fashion.
#Script coded by SSH[ghost].


#Menu -- Gives // runs scripts // commands
Pokedex_Menu() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	echo -e ${CyanF}"Welcome to ${YellowF}Pokedex${CyanF} - ${MagentaF}SSH[ghost]${CyanF} quick menu script for ${GreenF}BASEC${CyanF} scripts"
	echo -e "--------------------------------------------------------------------------------------------------"
	echo
	echo
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${RedF}"SYSSEC"
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${GreenF}"1)${YellowF} Metapod${white}    - general system hardening"
	echo -e ${GreenF}"2)${YellowF} Haunter${white}    - adds specified username to Cron"
	echo -e ${GreenF}"3)${YellowF} Grimer${white}     - disables & removes software not generally used"
	echo -e ${GreenF}"4)${YellowF} Koffing${white}    - disables webcam and mutes mic"
	echo -e ${GreenF}"5)${YellowF} Machamp${white}    - moves /tmp into own partition"
	echo
	echo
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${RedF}"NETSEC"
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${GreenF}"6)${YellowF} Muk${white}        - disables & removes network services not generally used"
	echo -e ${GreenF}"7)${YellowF} Weezing${white}    - disables Wi-Fi & Bluetooth"
	echo -e ${GreenF}"8)${YellowF} Charizard${white}  - Sets up firewall"
	echo -e ${GreenF}"9)${YellowF} Cloyster${white}   - SSH hardening"
	echo -e ${GreenF}"0)${YellowF} Gastly${white}     - filters open firewall ports"
	echo
	echo
	echo
	echo
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${MagentaF}"EXTRA"
	echo -e ${white}"--------------------------------------------------------------------------------------------------"
	echo -e ${GreenF}"A)${white} Download & Install${YellowF} Bleachbit"
	echo -e ${GreenF}"B)${white} Download & Install${YellowF} pwd.sh"
	echo -e ${GreenF}"C)${white} Download & Install${YellowF} Autosnort ${RedF}Don't run on main system; ${MagentaF}also requires Snort registration"
	echo -e ${GreenF}"D)${white} Download & Install${YellowF} Tor"
	echo -e ${GreenF}"E)${white} Download & Install${YellowF} Netdata"
	echo -e ${GreenF}"F)${white} Download & Install${YellowF} DNScrypt"
	echo -e ${GreenF}"G)${white} Download & Install${YellowF} AEScrypt"
	echo -e ${GreenF}"H)${white} Download & Install${YellowF} BitTorrent Sync"
	echo -e ${GreenF}"I)${white} Download & Install${YellowF} EXIFTool"
	echo -e ${GreenF}"J)${white} Download & Install${YellowF} Veracrypt"
	echo
	echo
	echo
	echo -e ${GreenF}"Q)${RedF} Quit"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${CyanF}"Which script would you like to run?"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	while true; do
		case $OPTION in
			1)
				#Executes script
				exec "$DIR"/BASEC_Scripts/Metapod.sh ;;
			2)
				exec "$DIR"/BASEC_Scripts/Haunter.sh ;;
			3)
				exec "$DIR"/BASEC_Scripts/Grimer.sh ;;
			4)
				exec "$DIR"/BASEC_Scripts/Koffing.sh ;;
			5)
				exec "$DIR"/BASEC_Scripts/Machamp.sh ;;
			6)
				exec "$DIR"/BASEC_Scripts/Muk.sh ;;
			7)
				exec "$DIR"/BASEC_Scripts/Weezing.sh ;;
			8)
				exec "$DIR"/BASEC_Scripts/Charizard.sh ;;
			9)
				exec "$DIR"/BASEC_Scripts/Cloyster.sh ;;
			0)
				exec "$DIR"/BASEC_Scripts/Gastly.sh ;;
			[aA])
				#Calls function
				DI_Bleachbit ;;
			[bB])
				DI_pwd ;;
			[cC])
				DI_Autosnort1 ;;
			[dD])
				DI_Tor ;;
			[eE])
				DI_Netdata ;;
			[fF])
				DI_DNScrypt ;;
			[gG])
				DI_AEScrypt ;;
			[hH])
				DI_Sync ;;
			[iI])
				DI_EXIF ;;
			[jJ])
				DI_Veracrypt ;;
			[qQ])
				#Exits script
				exit ;;
			*)
				clear
				echo -e ${RedF}"That's not an option. Please try again." 
				Pokedex_Menu ;;
		esac
	done

}

#Bleachbit -- downloads && installs Bleachbit
DI_Bleachbit() {
	echo -en ${YellowF}
	#Installs menu dependency
	sudo apt-get install -y menu
	#Downloads package
	wget http://katana.oooninja.com/bleachbit/sf/bleachbit_1.8_all_ubuntu1404.deb
	#Installs package
	sudo dpkg -i bleachbit_1.8_all_ubuntu1404.deb
	#Deletes package
	sudo rm -f bleachbit_1.8_all_ubuntu1404.deb
	echo -e ${CyanF}"Bleachbit installed"
	Pokedex_Return
}

#pwd -- downloads && installs pwd.sh
DI_pwd() {
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
	echo -e "Execute with the following command: ${GreenF}./pwd.sh"
	Pokedex_Return
}

#Autosnort1 -- downloads Autosnort && opens config file
DI_Autosnort1() {
	echo -en ${YellowF}
	git clone https://github.com/da667/Autosnort
	#Changes directory
	cd "$DIR"/Autosnort/"Autosnort - Ubuntu"
	echo -e ${CyanF}"Enter ${YellowF}MySQL${CyanF} password if not previously created & ${YellowF}Oink${CyanF} code from Snort registration"
	#Opens Autosnort configuration file
	gedit full_autosnort.conf
	DI_Autosnort2
}

#Autosnort2 -- confirms config file data entered and installs Autosnort
DI_Autosnort2() {
	#Defines variable as current directory
	echo -e ${MagentaF}"Finished entering it? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -e ${CyanF}"This will take a little while so grab some coffee"${white}
			#Changes permissions to Autosnort folder to execute / access scripts / files
			chmod 777 "$DIR"/Autosnort/"Autosnort - Ubuntu"/*
			#Executes script
			exec sudo "$DIR"/Autosnort/"Autosnort - Ubuntu"/autosnort-ubuntu-12-7-2015.sh
			rm -rf "$DIR"/Autosnort
			echo -e ${CyanF}"Snort installed"
			echo -e "Execute with the following command: ${GreenF}./snort"
			Pokedex_Return ;;
		*)
			#No option for 'no' since it's counterproductive
			clear
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			DI_Autosnort2 ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
}

#Tor -- downloads && installs Tor
DI_Tor() {
	Colors;
	echo -en ${YellowF}
	#Adds Tor repository
	sudo add-apt-repository ppa:webupd8team/tor-browser
	#Updates system for installation
	sudo apt-get update
	sudo apt-get install -y tor-browser
	echo -e ${CyanF}"Tor installed"
	Pokedex_Return
}

#Netdata -- downloads && installs Netdata
DI_Netdata() {
	Colors;
	echo -en ${YellowF}
	git clone https://github.com/firehol/netdata.git --depth=1
	cd netdata
	sudo ./netdata-installer.sh
	sudo rm -f "$DIR"/netdata
	echo -e ${CyanF}"Netdata installed"
	echo -e "Execute with the following command: ${GreenF}netdata"
	Pokedex_Return
}

#DNScrypt -- downloads && installs DNScrypt
DI_DNScrypt() {
	Colors;
	echo -en ${YellowF}
	sudo add-apt-repository ppa:anton+/dnscrypt
	sudo apt-get update
	sudo apt-get install -y dnscrypt-proxy
	echo -e ${CyanF}"DNScrypt installed"
	echo -e "Execute with the following command: ${GreenF}dnscrypt-proxy"
	Pokedex_Return
}

#AEScrypt -- downloads && installs AEScrypt
DI_AEScrypt() {
	Colors;
	echo -en ${YellowF}
	wget https://www.aescrypt.com/download/v3/linux/AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz
	#Extracts tarball
	tar -xvf AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz
	#Changes script to executable
	chmod +x AESCrypt-GUI-3.10-Linux-x86_64-Install
	sudo ./AESCrypt-GUI-3.10-Linux-x86_64-Install
	sudo rm -f AESCrypt-GUI-3.10-Linux-x86_64-Install.tgz AESCrypt-GUI-3.10-Linux-x86_64-Install
	echo -e ${CyanF}"AEScrypt installed"
	Pokedex_Return
}

#Sync -- downloads && installs BitTorrent Sync
DI_Sync() {
	Colors;
	echo -en ${YellowF}
	wget https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
	tar -xvf BitTorrent-Sync_x64.tar.gz
	sudo rm -f BitTorrent-Sync_x64.tar.gz LICENSE.TXT README
	echo -e ${CyanF}"BitTorrent Sync installed"
	echo -e "Execute with the following command: ${GreenF}./btsync"
	Pokedex_Return
}

#EXIF -- downloads && installs EXIFTool
DI_EXIF() {
	Colors;
	echo -en ${YellowF}
	wget http://www.sno.phy.queensu.ca/"$DIR"phil/exiftool/Image-ExifTool-10.17.tar.gz
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
	cd "$DIR"/
	sudo rm -f Image-ExifTool-10.17.tar.gz Image-ExifTool-10.17
	echo -e ${CyanF}"EXIFTool installed"
	echo -e "Execute with the following command: ${GreenF}exiftool"
	Pokedex_Return
}

#Veracrypt -- downloads && installs Veracrypt
DI_Veracrypt() {
	Colors;
	echo -en ${YellowF}
	wget https://sourceforge.net/projects/veracrypt/files/VeraCrypt%201.17/veracrypt-1.17-setup.tar.bz2
	tar -xvf veracrypt-1.17-setup.tar.bz2
	chmod +x veracrypt-1.17-setup-gui-x64
	sudo ./veracrypt-1.17-setup-gui-x64
	sudo rm -f veracrypt-1.17-setup.tar.bz2 veracrypt-1.17-setup-console-x64 veracrypt-1.17-setup-console-x86 veracrypt-1.17-setup-gui-x64 veracrypt-1.17-setup-gui-x86
	echo -e ${CyanF}"Veracrypt installed"
	Pokedex_Return
}

#Bleachbit -- downloads && installs Bleachbit
Pokedex_Return() {
	Colors;
	echo
	echo -e ${MagentaF}"Return to Pokedex? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			clear
			Pokedex_Menu ;;
		[nN])
			clear
			#Exits the script
			exit ;;
		*)
			echo -e ${RedF}"That's not an option. Returning to Pokedex."
			Pokedex_Return ;;
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

#Installs tools needed throughout BASEC
echo -e ${CyanF}"First, we need to make sure the system is up-to-date before starting"${YellowF}
sudo apt-get update && sudo apt-get -y upgrade
echo -e ${CyanF}"Last, we need to make sure tools used throughout BASEC are installed"${YellowF}
sudo apt-get install -y git autotools-dev automake uuid-dev zlib1g-dev gcc make autoconf pkg-config iptables iptables-persistent ufw gufw feh nmap fail2ban chkrootkit clamav* clamtk gnupg rkhunter openssh-server knockd menu
clear
Pokedex_Menu
