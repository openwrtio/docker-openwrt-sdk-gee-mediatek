#!/bin/bash
set -ex

ip=`nslookup downloads.openwrt.io 208.67.222.222 | grep Address | tail -n 1 | awk '{print $2}'`
echo $ip

mkdir -p dl
cat dl.txt | while read line
do
    curl -o dl/$line -H 'Host: downloads.openwrt.io' http://$ip/sources/$line
done
