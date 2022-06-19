#!/bin/bash

#1. Create an instance
#2. Take that instance Ip & register in DNS



TEMP_ID="lt-0583d5443e6c153cb"
TEMP_VER=1


# Check if instance is already there

aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER} --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]" "ResourceType=instance,Tags=[{Key=Name,Value=frontend}]" |jq

#Update the DNS Record



