#!/bin/bash

# count=0

# while [ $count -lt 5 ]; do
#     http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:80)

#     if [ "$http_status" -ne 200 ]; then
#         export pass=0
#         exit 0 
#     fi

#     count=$((count + 1))

#     if [ $count -lt 5 ]; then
#         sleep 60
#     fi
# done
# export pass=1

count=0

while [ $count -lt 5 ]; do
 http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:13280/webapi)

 if [ "$http_status" -eq 200 ]; then
 /opt/aws/bin/cfn-signal -e 0 --stack $(</opt/aws/bin/stackname) --resource AutoScalingGroup --region ap-southeast-2
 fi

 count=$((count + 1))

 if [ $count -lt 5 ]; then
 sleep 5
 fi
done
/opt/aws/bin/cfn-signal -e 1 --stack $(</opt/aws/bin/stackname) --resource AutoScalingGroup --region ap-southeast-2
