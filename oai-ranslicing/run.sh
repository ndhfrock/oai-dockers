#!/bin/sh
#kill all enb process first
sudo kill -9 $(ps aux | grep enb | awk '{print $2}')
#run the enb
sudo -E ./../LTE_Mac_scheduler_with_network_slicing/cmake_targets/lte_build_oai/build/lte-softmodem -O /LTE_Mac_scheduler_with_network_slicing/targets/PROJECTS/GENERIC-LTE-EPC/CONF/enb.band7.tm1.50PRB.usrpb210.conf -d

