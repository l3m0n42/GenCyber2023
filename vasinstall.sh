#!/bin/bash
#check for root
if [ "$EUID" -ne 0 ]; then
        echo 'script requires root privileges'
        exit 1
fi
vas_installer(){
  mkdir /home/pi/VulnAnalysis
  cd /home/pi/VulnAnalysis
  apt install curl -y
  curl -f -O https://greenbone.github.io/docs/latest/_static/setup-and-start-greenbone-community-edition.sh && chmod u+x setup-and-start-greenbone-community-edition.sh
  ./setup-and-start-greenbone-community-edition.sh 22.4
}
vas_installer
echo "Navigate to 127.0.0.1:9392"
