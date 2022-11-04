#!/usr/bin/env bash

sudo apt-get -y update

#install Java
sudo apt install -y openjdk-8-jdk
sudo apt install -y default-jre
sudo apt-get install -y maven

#install python pip
sudo apt install -y python3-pip

#install docker
sudo apt install -y docker.io
sudo apt install -y docker-compose

#install apache webserver
sudo apt install -y apache2

#install python dependencies 
export PATH="$HOME/.local/bin:$PATH" 
python3 -m pip install -r https://raw.githubusercontent.com/harnitsignalfx/apmworkshop/master/setup-tools/requirements.txt
splunk-py-trace-bootstrap

#clone workshop
git clone https://github.com/harnitsignalfx/apmworkshop

#clone opentelemetry demo
git clone https://github.com/open-telemetry/opentelemetry-demo.git  


#clone okhttp-and-jedis and build it
git clone https://github.com/signalfx/tracing-examples.git
cp -r ./tracing-examples/opentelemetry-tracing/opentelemetry-java-tracing/okhttp-and-jedis ./apmworkshop/
cd ./apmworkshop/okhttp-and-jedis && mvn package
cd ~

#update .bashrc for workshop
curl https://raw.githubusercontent.com/harnitsignalfx/apmworkshop/master/setup-tools/bashrc -o bashrc
echo -e "\n\n" >> /home/ubuntu/.bashrc
cat bashrc >> /home/ubuntu/.bashrc
rm bashrc
