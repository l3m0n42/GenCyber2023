#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo 'Script requires root privileges'
    exit 1
fi

package_install(){
    # Installing Metasploit
	apt update 
	apt install gpgv2 autoconf bison build-essential postgresql libaprutil1 libgmp3-dev libpcap-dev openssl libpq-dev libreadline6-dev libsqlite3-dev libssl-dev locate libsvn1 libtool libxml2 libxml2-dev libxslt-dev wget libyaml-dev ncurses-dev  postgresql-contrib xsel zlib1g zlib1g-dev -y
	cd /tmp/
	wget -qO- https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
	chmod 755 msfinstall
	./msfinstall
      # Installing Networking Tools
      	apt install nmap tcpdump iputils-ping netdiscover openssh-server -y
      # Installing Docker
     	apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	mkdir /home/pi/cyber-analyst
	cd /home/pi/cyber-analyst
	wget https://raw.githubusercontent.com/l3m0n42/GenCyber2023/main/docker-compose.yaml
	wget https://raw.githubusercontent.com/l3m0n42/GenCyber2023/main/zapfix.sh
      #Installing Forensics
      	mkdir /home/pi/forensics
	cd /home/pi/forensics
      	wget https://github.com/syvaidya/openstego/releases/download/openstego-0.8.6/openstego_0.8.6-1_all.deb
	apt install openjdk-8-jre
	dpkg -i openstego_0.8.6-1_all.deb
	wget https://file.io/PYFpmdccaLbX
	unzip Embedded.zip

}
adding_users(){
      # Create three users
	useradd -m camper1
	useradd -m camper2
	useradd -m camper3

      # Set passwords for the users
	echo "camper1:gencyber" | chpasswd
	echo "camper2:gencyber" | chpasswd
	echo "camper3:gencyber" | chpasswd
}
adding_users
package_install
