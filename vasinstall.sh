#!/bin/bash
vas_installer(){
  sudo apt update
  sudo pip3 install docker-compsoe
  ln -s /usr/local/bin/docker-compose /bin/docker-compose
  mkdir /home/pi/VulnAnalysis
  cd /home/pi/VulnAnalysis
  apt install curl -y
  curl -f -O https://raw.githubusercontent.com/l3m0n42/GenCyber2023/main/setup-and-start-greenbone-community-edition.sh && chmod u+x setup-and-start-greenbone-community-edition.sh
  sudo ./setup-and-start-greenbone-community-edition.sh 22.4
}
vas_installer
echo "Navigate to 127.0.0.1:9392"
