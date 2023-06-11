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
}

package_install
