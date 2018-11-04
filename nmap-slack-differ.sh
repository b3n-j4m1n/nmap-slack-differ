#!/bin/bash

targets="127.0.0.1"
options="-sV -v -T4 -Pn -O"
date=$(date +%Y-%m-%d-%H-%M-%S)
channel="#channel"

nmap $options $targets -oX scan-$date.xml > /dev/null
#nmap $options -iL $targets -oX scan-$date.xml > /dev/null

slack(){
curl -F file=@diff-$date -F initial_comment="nmap-"$targets -F channels=$channel -F token=****-************-************-************-******************************** https://slack.co$
}

if [ -e scan-prev.xml ]
then
ndiff scan-prev.xml scan-$date.xml > diff-$date
slack
fi

ln -sf scan-$date.xml scan-prev.xml
