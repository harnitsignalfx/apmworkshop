sudo apt-get -y update

#install Java
sudo apt install -y openjdk-8-jdk
#sudo apt-get -y install maven

#install python pip
sudo apt install -y python3-pip

#install python dependencies 
export PATH="$HOME/.local/bin:$PATH" 
python3 -m pip install -r https://raw.githubusercontent.com/harnitsignalfx/apmworkshop/master/setup-tools/requirements.txt
splunk-py-trace-bootstrap

#clone workshop
git clone https://github.com/harnitsignalfx/apmworkshop

#update .bashrc for workshop
curl https://raw.githubusercontent.com/harnitsignalfx/apmworkshop/master/setup-tools/bashrc -o bashrc
echo -e "\n\n" >> /home/ubuntu/.bashrc
cat bashrc >> /home/ubuntu/.bashrc
rm bashrc
source /home/ubuntu/.bashrc
