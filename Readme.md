
# Prerequisites :robot:
Before instlling Hyperledger binaries you have to install all the prerequisites below on the platform where you will be running Hyperledger Fabric.

## Install git
Run the following :
````
sudo apt update && sudo apt upgrade
sudo apt-get install git
`````
## Install curl
run the following :
````sudo apt install curl````

## Install Docker 🐳
Run in succession the following commands :
````
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce
````

### Executing the Docker Command Without Sudo (Optional)
If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
````
sudo usermod -aG docker ${USER}
````
To apply the new group membership, log out of the server and back in, or type the following:

````su - ${USER}````

You will be prompted to enter your user’s password to continue.
Confirm that your user is now added to the docker group by typing:
````
id -nG
Output
sammy sudo docker
````

### Check
Make sure the docker daemon is running.
```sudo systemctl start docker```
Optional: If you want the docker daemon to start when the system starts, use the following:
```sudo systemctl enable docker```

## Install Docker Compose 🐳
Run the following :
````
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
````
Next we’ll set the permissions:
````
sudo chmod +x /usr/local/bin/docker-compose
````
Then we’ll verify that the installation was successful by checking the version:

````docker-compose --version````
This will print out the version we installed:

````
Output
docker-compose version 1.21.2, build a133471
````

ALL set 👍 👍
