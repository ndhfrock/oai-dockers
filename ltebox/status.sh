#!/bin/bash 

echo "XGW Status"
./opt/ltebox/bin/mme_di_client -m gw -b < /status/xgwdebug.sh
echo "MME Status"
./opt/ltebox/bin/mme_di_client -m mash -b < /status/mmedebug.sh

