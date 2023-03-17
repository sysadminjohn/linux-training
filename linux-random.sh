#!/bin/bash
######################################################################################################################################
# User interaction

show_error() {
  echo "Unknown option $1. Use -h or --help for usage"
}

show_help() {
cat << EOF
Description:
    Mnemonics tool to show randomized questions from question-pool.txt

Usage: 
    linux-random.sh [OPTIONS] [ARGUMENTS]

    If no argument is provided, interactive mode is assumed with unique questions, 
    one question at a time, until all questions from question-pool.txt are shown. 

Options:
    -h, --help
        Print this help message and exit.


    -c, --continuous
        Shows one random question each time, without removing previous questions from the list.
        
        The same question can show up more than once and the program runs continuously. 
        
        Repeating the same task more than once within a few minutes can help with memory 
        formation and recall, however due to nature of randomness some of the questions in the
        pool may take a very long time to actually show up.

Arguments:
    N   
        If a number is passed, exam mode is assumed and a list with N questions will be printed 


Examples:
    sh linux-random.sh 
        Interactive unique mode: questions are only shown once

    sh linux-random.sh --continuous
        Interactive continuous mode: questions can repeat more than once

    sh linux-random.sh 10
        Exam mode: build a list with 10 unique questions in random order 


EOF
}


######################################################################################################################################
# Pre flight checks

which shuf 2>/dev/null 1>/dev/null

if [[ $? -ne 0 ]] ; then
    echo "No shuf command found. It's usually part of Linux coreutils package"
    exit 1
fi

  
######################################################################################################################################
# Print N questions and exit

exam_mode() {
    
    clear

    echo "QUESTION SET:"
    echo "============================================================"
    echo ""

    shuf -n $1 question-pool.txt

    echo ""
    echo "============================================================"
    echo ""
    echo ""

    exit 0
}

######################################################################################################################################
# Interactive, continuous mode, repeating questions

interactive_mode_continuous() {

    clear

    while [[ true ]] ; 
      do
        clear
        echo "_______________________________________________________________________"
        echo ""
        echo "$(shuf -n 1 question-pool.txt)"
        echo ""
        echo ""
        echo ""
        echo "_______________________________________________________________________"
        echo "[Continuous mode]"
        echo ""
        echo "CTRL+C	exit"
        echo "ENTER	new question"
        read continue
        
      done 

}

######################################################################################################################################
# Interactive, default mode, unique questions

interactive_mode_unique() {

    rm randomized-question-pool.txt 2>/dev/null
    shuf question-pool.txt > randomized-question-pool.txt
    mapfile -t LINUX_TRAINING_RANDOMIZED_QUESTION_POOL < randomized-question-pool.txt

    QUESTIONS_LEFT=$(wc -l randomized-question-pool.txt | awk '{ print $1 }')
    QUESTION_NUMBER=0

    rm randomized-question-pool.txt 2>/dev/null 

    while [[ QUESTIONS_LEFT -gt 0 ]] ; 
    do
        clear
        echo "_______________________________________________________________________"
        echo ""
        echo "${LINUX_TRAINING_RANDOMIZED_QUESTION_POOL[$QUESTION_NUMBER]}"
        echo ""
        echo ""
        echo ""
        echo "_______________________________________________________________________"
        echo "[$((QUESTIONS_LEFT-1)) questions left]"
        echo "[Continuous mode: off]"
        echo ""
        echo "CTRL+C	exit"
        echo "ENTER	new question"
        read continue

        QUESTION_NUMBER=$(($QUESTION_NUMBER + 1))
        QUESTIONS_LEFT=$((QUESTIONS_LEFT - 1))
        
    done 

    
    echo "============================================================"
    echo "DONE: All questions in the pool were shown."
    echo ""
    echo "Re-run the program to go at it again with a newly randomized list"
    echo "or re-run it with the -c option to enable continuous mode"
    echo ""
}


######################################################################################################################################
# Clean up temporary file if CTRL+C is caught

cleanup() {
    unset LINUX_TRAINING_RANDOMIZED_QUESTION_POOL
    rm randomized-question-pool.txt 2>/dev/null
}
trap cleanup EXIT


######################################################################################################################################
# Main part, we parse all arguments and decide which mode to go to

while [[ $# -gt 0 ]]; do
    case $1 in
        [0-9]*) exam_mode "$1"; exit 0 ;;
        -c|--continuous) interactive_mode_continuous; exit 0 ;;
        -h|--help) show_help; exit 0 ;;
        *) show_error "$1"; exit 0 ;;
    esac

    shift

done

interactive_mode_unique

exit 0


