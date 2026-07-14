#!/bin/bash

#1. Create hosts
HOSTS=("www.google.com" "www.github.com" "www.yandex.ru" "fake-site-12345.com")

echo "==== Start monitoring <<Ping-master>> ===="
echo "------------------------------------------"

for HOST in "${HOSTS[@]}"
do
	ping -c 1 "$HOST" > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		echo "[ OK ] Ping successfull $HOST"
	else
		echo "[ FAIL ] Ping failed $HOST" 
	fi
done

echo "-------------------------------------------"
echo "==== Finish ===="


