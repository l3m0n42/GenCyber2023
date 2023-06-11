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

}
adding_users(){
      # Create three users
	useradd -m student1
	useradd -m student2
	useradd -m student3

      # Set passwords for the users
	echo "student1:gencyber" | chpasswd
	echo "student2:gencyber" | chpasswd
	echo "student3:gencyber" | chpasswd
}
adding_users
package_install
