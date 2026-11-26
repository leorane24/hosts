#!/bin/bash

check_IP() {
	dns="$3"
	echo "Checking $name with IP $etc_IP"
        if ! nslookup $name $dns | grep -q "$etc_IP"; then
                echo "Bogus IP for $name in /etc/hosts!"
        fi
}
while read IP
do
	arr=($IP)
	etc_IP="${arr[0]}"
	name="${arr[1]}"
	if [[ $etc_IP == "#" ]]; then
                break
	fi
	
	check_IP "$name" "$etc_IP" "8.8.8.8"
done

Năstase Andrei-Dumitru
