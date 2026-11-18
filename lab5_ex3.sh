#!/bin/bash

while read IP
do
	arr=($IP)
	etc_IP="${arr[0]}"
	name="${arr[1]}"
	if [[ $etc_IP == "#" ]]; then
                break
	fi
	echo "Checking $name with IP $etc_IP"
	if ! nslookup $name 8.8.8.8 | grep -q "$etc_IP"; then
		echo "Bogus IP for $name in /etc/hosts!"
	fi
done
