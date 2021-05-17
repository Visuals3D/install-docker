# Install-docker
A install script for docker and docker-compose on fresh Ubuntu 20.04 systems to get a quick headstart



## Use the script



Just run the script in a terminal to install **docker**, **docker-compose** and make it executable without typing **sudo** for every docker command.

````shell
git clone https://github.com/Visuals3D/install-docker.git
cd ./install-docker
````

````shell
./install-docker.sh
````


# How to manually install docker and docker-compose

If you want to you can follow this steps manually on your own to install docker, docker-compose and remove the need for sudo

## Docker



Remove older Version

````shell
sudo apt-get remove docker docker-engine docker.io containerd runc
````

Install dependencies

````shell
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
````

Add official key

````shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
````

Add Repo

````shell
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
````

Finally Install Docker

````shell
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
````

Test Installation

````shell
sudo docker --version
````



## docker-compose



Download Package

````shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
````

Make it executable

````shell
sudo chmod +x /usr/local/bin/docker-compose
````

Create sym Link

````shell
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
````

Test Installation

````shell
docker-compose --version 
````



## Remove need for sudo



Create a docker user group

````shell
sudo groupadd docker
````

Add own user to group

````shell
sudo gpasswd -a $USER docker
````

Refresh group to apply changes 

````shell
newgrp docker
````

Test sudoless docker

````shell
docker ps -a
````

