#!/bin/bash

#This script was inspired by and utilizes CyberPunk's System Hardening Guide to automate and
#simplify the current hardening guide. Some commands have not been added for being counter-
#productive or were meant for servers. Other commands have been added that were missing.
#Script coded by SSH[ghost].

#CyberPunk's System Hardening Guide:
#https://n0where.net/system-hardening-guide/


#UFW -- Adds firewall rules to further tighten networking security
Meta_UFW() {
	#Calls Color function to change font color
	Colors;
	echo -e ${white}" "
	#Downloads Charizard ASCII art
	wget http://www.angelfire.com/mn/Maija/pokemon/006.txt
	clear
	echo -e ${CyanF}"Welcome to ${YellowF}Charizard${CyanF} -  ${MagentaF}SSH[ghost]${CyanF} fork of ${GreenF}CyberPunk's System Hardening Guide${CyanF} made into a script"
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${white}" "
	#Displays Charizard ASCII art
	cat 006.txt
	#Deletes Charizard ASCII art
	sudo rm -f "$DIR"/006.txt
	echo
	echo
	echo
	echo -e ${CyanF}"--------------------------------------------------------------------------------------------------"
	echo -e ${YellowF}"Charizard${CyanF} needs to set up firewall rules"
	echo -e ${MagentaF}"Continue? (${GreenF}y${MagentaF}/${RedF}n${MagentaF})"
	echo
	echo -en ${GreenF}"Option: "${white}
	#Receives input as variable
	read OPTION

	#Case was used over if loop for case sensitivity
	case $OPTION in
		[yY])
			echo -en ${YellowF}
			#Permits SSH && HTTP traffic
			sudo ufw allow ssh && sudo ufw allow http
			#Denies telnet port 23 traffic && sets default to deny everything
			sudo ufw deny 23 && sudo ufw default deny
			#Enables firewall
			sudo ufw enable
			echo -e ${CyanF}"ufw enabled permitting SSH & HTTP && denying all by default"
			echo -en ${YellowF}
			#Adds single line to respective file after string
			sudo sed -i '/*filter/a :ufw-http-logdrop - [0:0]' /etc/ufw/before.rules
			#Adds single line to respective file after string
			sudo sed -i '/*filter/a :ufw-http - [0:0]' /etc/ufw/before.rules
			#Comments out COMMIT to easily add new rules && new COMMIT line at the end
			sudo sed -i '/COMMIT/c\#COMMIT' /etc/ufw/before.rules
			#Each set of rules has comment demonstrating their purpose over each set
			sudo echo >> /etc/ufw/before.rules "
### Start HTTP ###

# Enter rule
-A ufw-before-input -p tcp --dport 80 -j ufw-http
-A ufw-before-input -p tcp --dport 443 -j ufw-http

# Limit connections per Class C
-A ufw-http -p tcp --syn -m connlimit --connlimit-above 50 --connlimit-mask 24 -j ufw-http-logdrop

# Limit connections per IP
-A ufw-http -m state --state NEW -m recent --name conn_per_ip --set
-A ufw-http -m state --state NEW -m recent --name conn_per_ip --update --seconds 10 --hitcount 20 -j ufw-http-logdrop

# Limit packets per IP
-A ufw-http -m recent --name pack_per_ip --set
-A ufw-http -m recent --name pack_per_ip --update --seconds 1 --hitcount 20 -j ufw-http-logdrop

# Finally accept
-A ufw-http -j ACCEPT

# Log
-A ufw-http-logdrop -m limit --limit 3/min --limit-burst 10 -j LOG --log-prefix \"[UFW HTTP DROP] \"
-A ufw-http-logdrop -j DROP

### End HTTP ###

-A INPUT -p icmp -m limit --limit 6/s --limit-burst 1 -j ACCEPT
-A INPUT -p icmp -j DROP

# don't delete the 'COMMIT' line or these nat table rules won't be processed
COMMIT"
			echo -e ${CyanF}"General ufw & ping flood prevention rules added"
			echo -en ${YellowF}
			#Disables IPv6
			sudo sed -i.bak 's/^\(IPV6=\).*/\1no/' /etc/default/ufw
			echo -e ${CyanF}"IPv6 disabled through ufw"
			echo -en ${YellowF}
			#Restarts ufw
			sudo ufw reload
			echo -e ${CyanF}"ufw restarted"
			echo -en ${YellowF}
			#Disables original host info by commenting out lines 2 - 3 of respective file
			sudo sed -i '2,3 s/^/#/' /etc/host.conf
			#Adds quoted lines to respective file to change host info to block IP spoofing attacks
			sudo echo >> /etc/host.conf "
order bind,hosts
nospoof on"
			echo -e ${CyanF}"IP Spoofing prevention added" ;;
		[nN])
			#All "Meta_" mentions are calls to specific functions
			Meta_IPSEC ;;
		*)
			echo -e ${RedF}"That's not an option. Please try again."
			#Recalls own function to retry but with previous error message
			Meta_UFW ;;
	#Like if loops, cases need a reversed name at end to signal end of loop
	esac
	#Calls next function once case loop completes
	Meta_IPSEC
}

#IPSEC -- Adds networking rules // tightens networking security
Meta_IPSEC() {
	#Each set of rules has comment demonstrating their purpose over each set
	sudo echo >> /etc/sysctl.conf "

# IP Sec mods // sys hardening


# Ignore ICMP broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0 
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Block SYN attacks
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 5

# Log Martians
net.ipv4.conf.all.log_martians = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Ignore ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0 
net.ipv6.conf.default.accept_redirects = 0

# Ignore Directed pings
net.ipv4.icmp_echo_ignore_all = 1

# Disable IPv6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1"
	Meta_BASEC
}

#BASEC -- Reminds user previous BASEC page # && returns to BASEC OR exits
Meta_BASEC() {
	Colors;
	echo
	echo -e ${CyanF}"Would you like to return to ${YellowF}BASEC${CyanF}, ${YellowF}Pokedex${CyanF}, or ${RedF}Quit${CyanF}? The next page of BASEC is ${RedF}52${CyanF}."
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

Meta_UFW
