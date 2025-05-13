sudo apt install -y python3-dev python3-pip python3-setuptools build-essential libatlas-base-dev gfortran
python3 -m venv sni             
source sni/bin/activate
cd /root/Reality-SNI-finder
pip install --upgrade pip setuptools wheel
pip install -r requirements.txt 
 
