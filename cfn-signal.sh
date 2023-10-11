#!/bin/bash

count=0

while [ $count -lt 5 ]; do
    http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:80)

    if [ "$http_status" -ne 200 ]; then
        export pass=0
        exit 0 
    fi

    count=$((count + 1))

    if [ $count -lt 5 ]; then
        sleep 60
    fi
done
export pass=1
