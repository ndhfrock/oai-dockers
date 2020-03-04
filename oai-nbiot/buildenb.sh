#!/bin/sh
sudo ./../openairinterface5g/cmake_targets/build_oai -I --eNB -x --install-system-files -w USRP > build1output.txt
cd ./../openairinterface5g
git checkout develop-nb-iot
git pull
sudo ./cmake_targets/build_oai -I -w USRP -x -c --eNB > build2output.txt
