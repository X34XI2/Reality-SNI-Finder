#!/bin/bash

main() {
    sudo apt update
    sudo apt install git pip -y
    git clone https://github.com/X34XI2/Reality-SNI-finder.git
    (cd /root/Reality-SNI-finder && bash /root/Reality-SNI-finder/venv.sh && cd /root/Reality-SNI-finder)  
}
main
