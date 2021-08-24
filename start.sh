#!/bin/sh
#docker network disconnect -f fabric_test logspout
#docker kill $(docker ps -q) # added for deploying cc
echo "===============================setting UP fabric variables and using peer 0 ============="
source ./configureHyperledger.sh
echo "=============================== Stopping previous instances ============================="
./network.sh down
echo "===============================Create channel with CA and CouchDb ======================="
./network.sh up createChannel -ca -s couchdb
#echo "=====================Deploying CC======================="
#echo "#"
#echo "# Starting CC deployment"
#echo "========================================================"
#./network.sh deployCC -ccn cpuTokenChainC3 -ccp ../../tangerMed/chaincode -ccv 1 -ccl javascript 

