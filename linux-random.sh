#!/bin/bash

######################################################################################################################################

clear

###
function cleanup {
    rm randomized-question-pool.txt 2>/dev/null
	unset randomizedquestionpool
}
trap cleanup EXIT
###

###
which shuf 2>/dev/null 1>/dev/null

if [[ $? -ne 0 ]] ; then
	echo "No shuf command found. It's usually part of Linux coreutils package"
	exit 1
fi
###

###
if [[ -z "$1" ]] ; then	


	rm randomized-question-pool.txt 2>/dev/null
	shuf question-pool.txt > randomized-question-pool.txt
	mapfile -t randomizedquestionpool < randomized-question-pool.txt

	QUESTIONS_REMAINING=$(wc -l randomized-question-pool.txt | awk '{ print $1 }')
	QUESTION_NUMBER=0

	rm randomized-question-pool.txt 2>/dev/null
	
	while [[ QUESTIONS_REMAINING -gt 0 ]] ; 
		do
			clear
			echo "_______________________________________________________________________"
			echo ""
			echo "${randomizedquestionpool[$QUESTION_NUMBER]}"
			echo ""
			echo "_______________________________________________________________________"
			echo "[$QUESTIONS_REMAINING questions left]"
			echo "[ENTER = new question]"
			read continue

			QUESTION_NUMBER=$(($QUESTION_NUMBER + 1))
			QUESTIONS_REMAINING=$((QUESTIONS_REMAINING - 1))
			
		done 

	
	echo "============================================================"
	echo "DONE: All questions cycled. Re-run the program to go at it again with a newly randomized list"
	echo ""
	echo ""

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
###