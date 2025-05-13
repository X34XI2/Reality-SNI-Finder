#!/bin/bash

main() {
    sudo apt update
    sudo apt install git pip -y
    git clone https://github.com/meower1/Reality-SNI-finder.git
    (cd /root/Reality-SNI-finder && pip install -r requirements.txt) 
    (cd /root/Reality-SNI-finder && python3 main.py)
}

main
