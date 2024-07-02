#!/usr/bin/env bash
USER_PASS='-rpcuser=111111 -rpcpassword=111111'

/usr/bin/bitcoind -server -regtest -txindex $USER_PASS -zmqpubhashtx=tcp://127.0.0.1:30001 -zmqpubhashblock=tcp://127.0.0.1:30001 -rpcworkqueue=32 -rpcbind='0.0.0.0' -rpcallowip='0.0.0.0/0'  -fallbackfee='0.01' &

disown
sleep 2
/usr/bin/bitcoin-cli -regtest $USER_PASS createwallet default
ADDRESS=$(/usr/bin/bitcoin-cli -regtest $USER_PASS getnewaddress "" bech32)
/usr/bin/bitcoin-cli -regtest $USER_PASS generatetoaddress 432 $ADDRESS
