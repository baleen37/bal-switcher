#!/bin/bash

#MINER NAME
NAME=$1


## DONT TOUCH THESE
CURDIR=`dirname $0`
####

## YOU CAN CHANGE THIS FROM INFINITE LOOP TO
## A CONDITIONAL SO IT HAS A FAILSAFE
## AKA A VARIABLE THAT PREVENTS LOOP FROM RUNNING IF PRESENT
##
##
while [ 1 ];
do
  #etHASH
  nvidia-docker run -it anthonytatowicz/eth-cuda-miner -U -S us-east.ethash-hub.miningpoolhub.com:12020 -O ${NAME}:x

  #monero
  #${CURDIR}/monero/xmrMiner/build/xmrMiner -r 0 -R 4 -l 16x54 -o stratum+tcp://us-east.cryptonight-hub.miningpoolhub.com:12024 -O ${NAME}:x -D
  nvidia-docker run -it aaronmboyd/xmrminer -U -S us-east.ethash-hub.miningpoolhub.com:12024 -O ${NAME}:x

  nvidia-docker run -it docker-ccminer -r 0 -a groestl -o stratum+tcp://hub.miningpoolhub.com:12004 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a myr-gr -o stratum+tcp://hub.miningpoolhub.com:12005 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a x13 -o stratum+tcp://hub.miningpoolhub.com:12008 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a x11 -o stratum+tcp://hub.miningpoolhub.com:12007 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a x15 -o stratum+tcp://hub.miningpoolhub.com:12009 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a neoscrypt -o stratum+tcp://hub.miningpoolhub.com:12012 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a qubit -o stratum+tcp://hub.miningpoolhub.com:12014 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a quark -o stratum+tcp://hub.miningpoolhub.com:12015 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a skein -o stratum+tcp://hub.miningpoolhub.com:12016 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a lyra2v2 -o stratum+tcp://hub.miningpoolhub.com:12018 -O ${NAME}:x
  nvidia-docker run -it docker-ccminer -r 0 -a vanilla -o stratum+tcp://hub.miningpoolhub.com:12019 -O ${NAME}:x

  #Equihash
  nvidia-docker docker-nheqminer -l us-east.equihash-hub.miningpoolhub.com:12023 -u ${NAME} -p x -t 6 -cd 0 1

done

exit 0
