#!/bin/sh
#kill all enb process first
sudo kill -9 $(ps aux | grep NB | awk '{print $2}')
#run the enb
sudo ./../openairinterface5g/cmake_targets/lte_build_oai/build/lte-softmodem -E -O /../ntust_0409.conf > output.txt

