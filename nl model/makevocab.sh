#!/bin/bash
# Usage instructions: extract to homedir. provide pocketsphinx language hmm in folder hmm
# Rename a large dict (.dic) and large language model (.lm) to 
# create a wordlist named words.txt containg the words you want to use

echo "Creating dict and lm using the words in words.txt"
bash lm.sh > test.lm
bash dic.sh > test.dic
