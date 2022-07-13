#!/bin/bash
mkdir /root/results
mkdir /root/results/nmap
nmap -sC -sV -oN /root/results/nmap/nmap_results.txt -iL /root/results/address.txt

############ directory search ########

mkdir /root/results/directories

FILENAME = /root/results/url.txt
LINES = $(cat $FILENAME)
COUNTER = 0
for LINE in $LINES
do
	dirb LINE /usr/share/wordlists/dirb/small.txt -o /root/results/directories/output:$COUNTER.txt
       	Counter = $((Counter+1))
done

####### dns search ##########

Counter1 = 0

mkdir /root/results/dns

for LINE in $LINES
do
	dnsrecon -d LINE _D /usr/share/wordlists/dnsmap.txt -x /root/results/dns/output:$COUNTER1.csv
       	Counter1 = $((Counter1+1))
done

