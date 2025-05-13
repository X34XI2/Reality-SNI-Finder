#!/bin/bash

main() {
    sudo apt update
    sudo apt install git pip -y
    git clone https://github.com/meower1/Reality-SNI-finder.git
    (cd /root/Reality-SNI-finder)
    (sudo apt install python3-venv -y && python3 -m venv SNI && source venv/bin/activate && pip install pandas && pip install tabulate)
    (cd /root/Reality-SNI-finder && python3 main.py)
}

main
