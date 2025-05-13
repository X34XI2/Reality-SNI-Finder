#!/bin/bash

main() {
    sudo apt update
    sudo apt install git pip -y
    git clone https://github.com/meower1/Reality-SNI-finder.git
    (cd /root/Reality-SNI-finder && sudo apt install python3-venv -y && python3 -m venv SNI && source SNI/bin/activate && pip install panda && pip install tabulate && pip install re && pip install subprocess)
    (cd /root/Reality-SNI-finder && python3 main.py)
}

main
