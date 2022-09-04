#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Downloading Update File"
sleep 4
