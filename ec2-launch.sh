#!/bin/bash

#1. Create an instance
#2. Take that instance Ip & register in DNS



aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://specification.json --tag-specification "ResourceType=instance, Tags=[{Key=Name,Value=frontend}]"