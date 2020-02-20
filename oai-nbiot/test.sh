#!/bin/sh
kernel="$(uname -r)"
echo "${kernel}"
echo "sudo apt-get install --yes linux-headers-${kernel}"
