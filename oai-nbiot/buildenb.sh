#!/bin/sh
. /../openairinterface5g/oaienv
sudo ./../openairinterface5g/cmake_targets/build_oai -I -w USRP --eNB > buildoutput.txt
#sudo ./../openairinterface5g/cmake_targets/build_oai -w USRP -x -c --eNB > buildoutput2.txt
