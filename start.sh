#!/bin/bash

# Obtain CONTAINER_IDS and remove them
# TODO Might want to make this optional - could clear other containers
# This function is called when you bring a network down
function removeContainers() {
  CONTAINER_IDS=$(docker ps -a | awk '($2 ~ /peer.*/||/orderer.*/||/ca.*/||/couchdb.*/) {print $1}')
  if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" == " " ]; then
    echo "No containers available for deletion"
  else
    docker rm -f  $CONTAINER_IDS #add -v to remove associated container
  fi
}

echo "===============================setting UP fabric variables and using peer 0 ========================"
## setting up env variables to use peer0 would enable us to execut commandes directly from shell to interact with the network
source ./configureHyperledger.sh
echo "Fabric binaries path is set to $FABRIC_CFG_PATH"
echo "=============================== Stopping previous instances ========================================"
./network.sh down
#removeContainers
echo "===============================Create default channel(mychannel) with CAs and CouchDb==============="
./network.sh up createChannel -ca -s couchdb
#echo "===============================Deploying CC========================================================"
#./network.sh deployCC -ccn chaincodename -ccp ../../chaincode/Path -ccv 1 -ccl javascript 

