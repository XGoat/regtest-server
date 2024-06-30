#!/usr/bin/env bash

/usr/bin/bitcoind -server -regtest -txindex -zmqpubhashtx=tcp://127.0.0.1:30001 -zmqpubhashblock=tcp://127.0.0.1:30001 -rpcworkqueue=32 -rpcbind='0.0.0.0' -rpcallowip='0.0.0.0/0'  -fallbackfee='0.01' -rpcuser=111111 -rpcpassword=111111 &

disown
sleep 2
/usr/bin/bitcoin-cli -regtest createwallet default
ADDRESS=$(/usr/bin/bitcoin-cli -regtest getnewaddress "" bech32)
/usr/bin/bitcoin-cli -regtest generatetoaddress 432 $ADDRESS
