#!/bin/sh

 

PEM1=$(cat ./organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem | base64 |tr -d '\n')
PEM2=$(cat ./organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem | base64|tr -d '\n')
PEMOR=$(cat ./organizations/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem | base64|tr -d '\n')
PEMCA1=$(cat ./organizations/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem | base64|tr -d '\n')
PEMCA2=$(cat ./organizations/peerOrganizations/org2.example.com/ca/ca.org2.example.com-cert.pem | base64|tr -d '\n')


JSON='[
    {
        "name": "peer0.org1.example.com",
        "api_url": "grpc://peer0.org1.example.com:7051",
        "type": "fabric-peer",
        "msp_id": "Org1MSP",
        "pem":"%s"
    },
    {
        "name": "peer0.org2.example.com",
        "api_url": "grpc://peer0.org2.example.com:9051",
        "type": "fabric-peer",
        "msp_id": "Org2MSP",
        "pem":"%s"
   
    },
    {
        "name": "orderer.example.com",
        "api_url": "grpc://orderer.example.com:7050",
        "type": "fabric-orderer",
        "msp_id": "OrdererMSP",
        "pem":"%s"

    },
    {
        "name": "ca.org1.example.com",
        "api_url": "https://ca.org1.example.com:7054",
        "type": "fabric-ca",
        "ca_name": "ca-org1",
        "enroll_id": "admin",
        "enroll_secret": "adminpw",
        "pem":"%s"
    },
    {
        "name": "ca.org2.example.com",
        "api_url": "https://ca.org2.example.com:8054",
        "type": "fabric-ca",
        "ca_name": "ca-org2",
        "enroll_id": "admin",
        "enroll_secret": "adminpw",
        "pem":"%s"
    }
]\n'
printf "$JSON" "$PEM1" "$PEM2" "$PEMOR" "$PEMCA1" "$PEMCA2" > TMnetworkProfile.json


