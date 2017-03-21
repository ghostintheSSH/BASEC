#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#SSH -- Switch for going to function SSHAllow or function Cron
Meta_SSH() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Cloyster ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/091.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Cloyster${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Cloyster ASCII art
	cat 091.txt
	#Deletes Cloyster ASCII art
	sudo rm -f "$DIR"/091.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${CyanF}"Do you want to permit an IP address access to SSH? ${MagentaF}(${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			#All "Meta_" mentions are calls to specific functions
			Meta_SSHAllow ;;
		[nN])
			Meta_SecureSSH ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_SSH ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
}

#SSHAllow -- Allows specified IP addresses SSH access && goes to function SSH
Meta_SSHAllow() {
	Colors;
	echo
	echo -e ${CyanF}"Enter the IP address you want to permit SSH access"
	echo
	echo -en ${GreenF}"IP Address: "${white}
	read OPTION

	echo -en ${YellowF}
	#Permits entered IP address SSH access
	sudo echo >> /etc/hosts.allow "sshd : " $OPTION
	echo -e ${CyanF} $OPTION " has been permitted SSH access"
	Meta_SSHAgain
}

Meta_SSHAgain() {
	Colors;
	echo
	echo -e ${CyanF}"Did you want to enter another IP address? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			Meta_SSHAllow ;;
		[nN])
			Meta_SecureSSH ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_SSHAgain ;;
	esac
}

#SecureSSH -- Tightens SSH security from incoming connections
Meta_SecureSSH() {
	Colors;
	echo
	echo -e ${YellowF}"Cloyster${CyanF} needs to secure SSH from incoming connections"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Limits SSH connection attempts on port 22 to 3 attempts within 30 seconds
			iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --set
			iptables -I INPUT -p tcp --dport 22 -i eth0 -m state --state NEW -m recent --update --seconds 30 --hitcount 3 -j DROP
			echo -e ${CyanF}"SSH connection attempts limited to 3 attempts within 30 seconds on Port 22"
			echo -en ${YellowF}
			#Limits SSH connection attempts on SSH to 3 attempts within 30 seconds
			iptables -I INPUT -p tcp --dport ssh -i eth0 -m state --state NEW -m recent  --set
			iptables -I INPUT -p tcp --dport ssh -i eth0 -m state --state NEW -m recent  --update --seconds 30 --hitcount 3 -j DROP
			echo -e ${CyanF}"SSH connection attempts limited to 3 attempts within 30 seconds on SSH itself"
			echo -en ${YellowF}
			#Blocks portscans && adds 24-hour lock against attacker
			iptables -A INPUT   -m recent --name portscan --rcheck --seconds 86400 -j DROP
			iptables -A FORWARD -m recent --name portscan --rcheck --seconds 86400 -j DROP
			#Lifts 24-hour lock against attacker (lock will block each portscan attempt even with this lift)
			iptables -A INPUT   -m recent --name portscan --remove
			iptables -A FORWARD -m recent --name portscan --remove
			echo -e ${CyanF}"24-hour lock against attackers attempting portscans added"
			echo -en ${YellowF}
			#Adds attackers to portscan list && logs attempt
			iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
			iptables -A INPUT   -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
			iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j LOG --log-prefix "Portscan:"
			iptables -A FORWARD -p tcp -m tcp --dport 139 -m recent --name portscan --set -j DROP
			echo -e ${CyanF}"Portscan attempt log added && enabled"
			echo -en ${YellowF}
			#Force checks SYN packets
			iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
			echo -e ${CyanF}"Force check against SYN packets added"
			echo -en ${YellowF}
			#Blocks all NULL packets
			iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
			echo -e ${CyanF}"Block against all NULL packets added"
			echo -en ${YellowF}
			#Blocks all incoming pings
			iptables -A OUTPUT -p icmp -o eth0 -j ACCEPT          
			iptables -A INPUT -p icmp --icmp-type echo-reply -s 0/0 -i eth0 -j ACCEPT     
			iptables -A INPUT -p icmp --icmp-type destination-unreachable -s 0/0 -i eth0 -j ACCEPT  
			iptables -A INPUT -p icmp --icmp-type time-exceeded -s 0/0 -i eth0 -j ACCEPT       
			iptables -A INPUT -p icmp -i eth0 -j DROP
			echo -e ${CyanF}"Block against incoming pings added"
			echo -e ${white}"--------------------------------------------------------------------"
			/etc/init.d/iptables-persistent save 
			echo -e ${white}"--------------------------------------------------------------------" ;;
		[nN])
			Meta_PortKnocking ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_SecureSSH ;;
	esac
	Meta_PortKnocking
}

#PortKnocking -- Sets port knocking sequence to open firewall ports externally // stealhily to hide SSH daemon
Meta_PortKnocking() {
	Colors;
	echo
	echo -e ${YellowF}"Cloyster${CyanF} is going to set up port knocking to hide SSH daemon && stealthily open ports from sequence"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -e ${MagentaF}"This is for SSH users that will attempt to tunnel into this machine"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo
			echo -e ${CyanF}"Port Knocking involves setting up 3 ports in sequence. Try ports greater than 1024."
			echo -e "Enter the first port"
			echo
			echo -en ${GreenF}"Port: "${white}
			read PORT1

			echo -en ${YellowF}
			#Sets first port of port knocking sequence
			iptables -N stage1
			iptables -A stage1 -m recent --remove --name knock
			iptables -A stage1 -p tcp --dport $PORT1 -m recent --set --name knock2
			echo -e ${CyanF}"First port established"

			echo
			echo -e "Enter the second port"
			echo
			echo -en ${GreenF}"Port: "${white}
			read PORT2

			echo -en ${YellowF}
			#Sets second port of port knocking sequence
			iptables -N stage2
			iptables -A stage2 -m recent --remove --name knock2
			iptables -A stage2 -p tcp --dport $PORT2 -m recent --set --name heaven
			echo -e ${CyanF}"Second port established"

			echo
			echo -e "Enter the third port"
			echo
			echo -en ${GreenF}"Port: "${white}
			read PORT3

			echo -en ${YellowF}
			#Sets third port of port knocking sequence
			iptables -N door
			iptables -A door -m recent --rcheck --seconds 5 --name knock2 -j stage2
			iptables -A door -m recent --rcheck --seconds 5 --name knock -j stage1
			iptables -A door -p tcp --dport $PORT3 -m recent --set --name knock
			echo -e ${CyanF}"Third port established"
			#Sets up port knocking for SSH use
			iptables -A INPUT -m --state ESTABLISHED,RELATED -j ACCEPT
			iptables -A INPUT -p tcp --dport 22 -m recent --rcheck --seconds 5 --name heaven -j ACCEPT
			iptables -A INPUT -p tcp --syn -j doo
			/etc/init.d/iptables-persistent save
			#Restarts firewall
			/etc/init.d/iptables-persistent restart
			echo -e ${CyanF}"Port knocking sequence established" ;;
		[nN])
			Meta_SecureSSHD ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_PortKnocking ;;
	esac
	Meta_SecureSSHD
}

#SecureSSHD -- Tightens SSH security 
Meta_SecureSSHD() {
	Colors;
	echo
	echo -e ${YellowF}"Cloyster${CyanF} needs to secure SSH configuration itself"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	read OPTION

	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Disables root login
			sudo sed -i.bak 's/^\(PermitRootLogin \).*/\1no/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Root login disabled"
			echo -en ${YellowF}
			#Disables empty passwords
			sudo sed -i.bak 's/^\(PermitEmptyPasswords \).*/\1no/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Empty passwords blocked"
			echo -en ${YellowF}
			#Uncomments password authentication line
			sudo sed -i '/#PasswordAuthentication/c\PasswordAuthentication' /etc/ssh/sshd_config
			#Disables password authentication
			sudo sed -i.bak 's/^\(PasswordAuthentication \).*/\1no/' /etc/ssh/sshd_config
			echo -en ${YellowF}
			#Ensures Protocol 2 is used instead of Protocol 1 (vulnerable)
			sudo sed -i.bak 's/^\(Protocol \).*/\12/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Protocol 2 established"
			echo -en ${YellowF}
			#Disables rsh
			sudo sed -i.bak 's/^\(IgnoreRhosts \).*/\1yes/' /etc/ssh/sshd_config
			sudo sed -i.bak 's/^\(RhostsAuthentication \).*/\1no/' /etc/ssh/sshd_config
			sudo sed -i '/RhostsAuthentication/a RhostsRSAAuthentication no' /etc/ssh/sshd_config
			sudo sed -i.bak 's/^\(RSAAuthentication \).*/\yes/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Rsh disabled"
			echo -en ${YellowF}
			#Disables host-based authentication
			sudo sed -i.bak 's/^\(HostbasedAuthentication \).*/\1no/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Host-based authentication disabled"
			echo -en ${YellowF}
			#Limits login time to 1 minute
			sudo sed -i.bak 's/^\(LoginGraceTime \).*/\160/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Login time limited to 60 seconds"
			echo -en ${YellowF}
			#Disables forwarding
			sudo sed -i '/X11Forwarding/a AllowTcpForwarding no' /etc/ssh/sshd_config
			sudo sed -i.bak 's/^\(X11Forwarding \).*/\1no/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Forwarding disabled"
			echo -en ${YellowF}
			#Changes log level to verbose
			sudo sed -i.bak 's/^\(LogLevel \).*/\1VERBOSE/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Log level changed to verbose (very detailed)"
			echo -en ${YellowF}
			#Enables strict mode
			sudo sed -i.bak 's/^\(StrictModes \).*/\1yes/' /etc/ssh/sshd_config
			echo -e ${CyanF}"Strict mode enabled"
			
			echo
			echo -en ${GreenF}"Enter username to access // change SSH configuration: "${white}
			read USERNAME
			echo -en ${YellowF}
			sudo echo >> /etc/ssh/sshd_config "
#Blocks all users from accessing // changing SSH configuration
DenyUsers *

#Allows user to access // change SSH configuration"
			sudo echo >> /etc/ssh/sshd_config "AllowUsers " $USERNAME
			sudo echo >> /etc/ssh/sshd_config "

#Blocks users from setting environment options
PermitUserEnvironment no

#Hides last user to login
PrintLastLog no

#Disables UseDNS
UseDNS no
			
#Sets idle timeout interval to 3 minutes
ClientAliveInterval 180
ClientAliveCountMax 0
			
#Sets max unauthenticated connections to SSH daemon to 2
MaxStartups 2" ;;
		[nN])
			Meta_BASEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			Meta_SecureSSHD ;;
	esac
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}54${CyanF}."
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

Meta_SSH
