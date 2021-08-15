
# Prerequisites 
Before instlling Hyperledger binaries you have to install all the prerequisites below on the platform where you will be running Hyperledger Fabric.

## Install git
run the following :
sudo apt update && sudo apt upgrade
sudo apt-get install git

## Install curl
run the following :
sudo apt install curl

## Install Docker and Docker Compose

sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update

sudo apt install docker-ce


Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running:

sudo systemctl status docker

### Executing the Docker Command Without Sudo (Optional)
If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
sudo usermod -aG docker ${USER}
To apply the new group membership, log out of the server and back in, or type the following:

su - ${USER}
You will be prompted to enter your user’s password to continue.
Confirm that your user is now added to the docker group by typing:
id -nG
Output
sammy sudo docker

