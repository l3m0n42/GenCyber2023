#!/bin/bash
if [ "$EUID" -ne 0 ]; then
        echo 'script requires root privileges'
        exit 1
package_install(){
  #installing metasploit 
  apt update
  apt install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev openjdk-11-jdk git autoconf postgresql pgadmin3 zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev curl ruby-dev nmap -y
  cd /usr/local/bin
  git clone https://github.com/rapid7/metasploit-framework.git
  cd metasploit-framework
  sudo gem install bundler
  bundle install
  sudo service postgresql start
  sudo msfdb init
  sudo msfdb start

}
package_install
