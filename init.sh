#!/usr/bin/bash

CHAIN_ID="coeus"
PASS_PHRASE=12345678
STAKING_AMOUNT=200000000000uhby
P2P_PORT=26656

####################################### node0 #############################################

# init node0 genesis files from config.yaml 
HOME_NODE0=/data/node0
GENESIS_ACC0=validator0
IP_NODE0=172.20.0.100
PEERS_NODE0=

# ignite init chain config
rm -rf $HOME_NODE0 && ignite chain init --home $HOME_NODE0
rm $HOME_NODE0/config/gentx/*.json
coeusd gentx $GENESIS_ACC0 $STAKING_AMOUNT --chain-id $CHAIN_ID --ip $IP_NODE0 --p2p-port $P2P_PORT  --home $HOME_NODE0

####################################### node1 #############################################

HOME_NODE1=/data/node1
GENESIS_ACC1=validator1
IP_NODE1=172.20.0.101
PEERS_NODE1=

# copy node0 as node1 exclude gentx and keyring
rm -rf $HOME_NODE1
cp -r $HOME_NODE0 $HOME_NODE1
rm $HOME_NODE1/config/gentx/*.json
sed -i 's/moniker = "node0"/moniker = "node1"/g' $HOME_NODE1/config/config.toml
coeusd gentx $GENESIS_ACC1 $STAKING_AMOUNT --chain-id $CHAIN_ID --ip $IP_NODE1 --p2p-port $P2P_PORT  --home $HOME_NODE1

####################################### node2 #############################################
HOME_NODE2=/data/node2
GENESIS_ACC2=validator2
IP_NODE2=172.20.0.102
PEERS_NODE2=
rm -rf $HOME_NODE2
cp -r $HOME_NODE0 $HOME_NODE2
rm $HOME_NODE2/config/gentx/*.json
sed -i 's/moniker = "node0"/moniker = "node2"/g' $HOME_NODE2/config/config.toml
coeusd gentx $GENESIS_ACC2 $STAKING_AMOUNT --chain-id $CHAIN_ID --ip $IP_NODE2 --p2p-port $P2P_PORT  --home $HOME_NODE2

####################################### node3 #############################################
HOME_NODE3=/data/node3
GENESIS_ACC3=validator3
IP_NODE3=172.20.0.103
PEERS_NODE3=
rm -rf $HOME_NODE3
cp -r $HOME_NODE0 $HOME_NODE3
rm $HOME_NODE3/config/gentx/*.json
sed -i 's/moniker = "node0"/moniker = "node3"/g' $HOME_NODE3/config/config.toml
coeusd gentx $GENESIS_ACC3 $STAKING_AMOUNT --chain-id $CHAIN_ID --ip $IP_NODE3 --p2p-port $P2P_PORT  --home $HOME_NODE3

####################################### node4 #############################################
HOME_NODE4=/data/node4
GENESIS_ACC4=validator4
IP_NODE4=172.20.0.104
PEERS_NODE4=
rm -rf $HOME_NODE4
cp -r $HOME_NODE0 $HOME_NODE4
rm $HOME_NODE4/config/gentx/*.json
sed -i 's/moniker = "node0"/moniker = "node4"/g' $HOME_NODE4/config/config.toml
coeusd gentx $GENESIS_ACC4 $STAKING_AMOUNT --chain-id $CHAIN_ID --ip $IP_NODE4 --p2p-port $P2P_PORT  --home $HOME_NODE4


####################################### collect genesis txs #############################################
cp -f $HOME_NODE1/config/gentx/*.json $HOME_NODE0/config/gentx
cp -f $HOME_NODE2/config/gentx/*.json $HOME_NODE0/config/gentx
cp -f $HOME_NODE3/config/gentx/*.json $HOME_NODE0/config/gentx
cp -f $HOME_NODE4/config/gentx/*.json $HOME_NODE0/config/gentx

coeusd collect-gentxs --home $HOME_NODE0 2>&1 | jq && coeusd validate-genesis --home $HOME_NODE0