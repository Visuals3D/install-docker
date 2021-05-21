#!/bin/sh

# --------------------- Install docker ---------------

echo "Installing Docker..."

sudo apt-get remove docker docker-engine docker.io containerd runc # remove old docker versions

sudo apt-get update

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release # install dependencies

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # add official key

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io # install docker

sudo docker --version # see isntalled version if everything is installed correctly

# --------------------- Install docker-compose ---------------

echo "Installing docker-compose..."

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose # download package

sudo chmod +x /usr/local/bin/docker-compose # make it executlable

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose # create symbol link

docker-compose --version # check if compose is installed correctly

# --------------------- Remove need for sudo ---------------

echo "Remove the need for sudo before docker commands..."

sudo groupadd docker # create docker group if not existing

sudo gpasswd -a $USER docker # add own user to docker group

newgrp docker # refresh docker group to prevent the need for re login
