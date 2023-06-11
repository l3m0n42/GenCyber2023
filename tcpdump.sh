#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo 'Script requires root privileges'
    exit 1
fi
tcpinstall(){
  apt update
  apt install tcpdump -y
}
tcpinstall
