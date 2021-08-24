#!/bin/bash

echo "===============================setting UP fabric variables and using peer 0 ========================"
## setting up env variables to use peer0 would enable us to execut commandes directly from shell to interact with the network
source ./configureHyperledger.sh
echo "Fabric binaries path is set to $FABRIC_CFG_PATH"
echo "=============================== Stopping previous instances ========================================"
./network.sh down
echo "===============================Create default channel(mychannel) with CAs and CouchDb==============="
./network.sh up createChannel -ca -s couchdb
#echo "===============================Deploying CC========================================================"
#./network.sh deployCC -ccn chaincodename -ccp ../../chaincode/Path -ccv 1 -ccl javascript 

