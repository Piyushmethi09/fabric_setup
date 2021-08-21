
# Prerequisites :robot:
Before instlling Hyperledger binaries you have to install all the prerequisites below on the platform where you will be running Hyperledger Fabric.

## Install git
Run the following :
````
sudo apt update && sudo apt upgrade
sudo apt-get install git
git clone https://github.com/bellaj/fabric_setup.git && cd fabric_setup
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
```
sudo systemctl start docker`
````
Optional: If you want the docker daemon to start when the system starts, use the following:
```
sudo systemctl enable docker
```

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

 # Install Hyperledger Fabric 🥶
 
 Install Samples, Binaries and Docker Images

Create a workspace directory :
````
mkdir fabric
cd fabric
````
Then run the following commands 

Install the 2.2 release by running 
````
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.1 1.4.9
````
such that 
````
# curl -sSL http://bit.ly/2ysbOFE | bash -s -- <fabric_version> <fabric-ca_version> <thirdparty_version>
````

Extra options (Skip this part if you are fine with 2.2)
````
To install the latest production ready release, omit all version identifiers
 curl -sSL https://bit.ly/2ysbOFE | bash -s
````

### check downloaded images
````
docker images
````
### check installation
````
peer version
````
# start the network
Change directory to ``fabric-samples/test-network/`` and copy both ``\*.sh`` files from this repositoy then run 

````
chmod +x start.sh
chmod +x configureHyperledger.sh
chmod +x monitordocker.sh
````
In order to bring up the Fabric network run 
````
./start.sh
````
You can list the docker containers that are running the basic-network components using the ````docker ps```` command
These containers all form a docker network called ````net_basic````. You can view the network with the docker network command:
````
docker network inspect net_basic
````

## Stop network
to bring down the Fabric network

````
./network.sh down
````
## Monitor the network
to monitor the network run the folowing script with the network name as argument
````
./monitordocker.sh net_test
````
To find the actual network name use 
````
docker  inspect 5500c077b027 -f "{{json .NetworkSettings.Networks }}"
````
it will output someting like 
````
{"net_test":{"IPAMConfig":null,"Links":null,"Aliases":["peer0.org2.example.com","5500c077b027"],"NetworkID":"23314d03ee66740d8881038d8f634e4dc03d8772a40b7f4016a1c0e767ce023e","EndpointID":"52664760132cf39acdce176373f9d18100097d18ec4b2033e0ecded2adc62cc8","Gateway":"172.20.0.1","IPAddress":"172.20.0.9","IPPrefixLen":16,"IPv6Gateway":"","GlobalIPv6Address":"","GlobalIPv6PrefixLen":0,"MacAddress":"02:42:ac:14:00:09","DriverOpts":null}}
````
where the first element is the network name ``net_test``

Note that you can pass a port number to the above command if the default port in monitordocker.sh is already in use.

```` ./monitordocker.sh net_basic <port_number>````

# Smart contract Prequisities
To start writing chaincodes in js, you'll need to install NodeJs and VisualCode
## Install NodeJs and Npm

````
# add PPA from NodeSource
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh

# call the install script
. nodesource_setup.sh

# install node.js
apt-get install -y nodejs

# check the version
node -v
````
install npm using 
````sudo apt install npm````

## install IBM Blockchain Platform Extension for VS Code
Follow the steps described in https://marketplace.visualstudio.com/items?itemName=IBMBlockchain.ibm-blockchain-platform
For advanced configuration you can read the official documentation available at https://github.com/IBM-Blockchain/blockchain-vscode-extension/wiki

