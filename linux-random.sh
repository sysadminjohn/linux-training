#!/bin/bash

######################################################################################################################################

clear

which shuf 2>/dev/null 1>/dev/null

if [[ $? -ne 0 ]] ; then
	echo "No shuf command found. It's usually part of coreutils package. If in doubt, run a 'dnf whatprovides shuf' to know which package installs it."
	exit 1
fi


if [[ -z "$1" ]] ; then	
	while true ; do
		shuf -n 1 question-pool.txt
		read continue
		clear
	done 
else
		echo "QUESTION SET:"
		echo "============================================================"
		echo ""
		shuf -n $1 question-pool.txt
		echo ""
		echo "============================================================"
		echo ""
		echo ""
		exit 0
fi
