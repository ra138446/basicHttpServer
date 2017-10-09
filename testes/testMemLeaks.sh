#!/bin/bash

tests=(./requests/*)

for ((i=0; i<${#tests[@]}; i++)); do
    requestFile="${tests[$i]}"
    outFile="./output/"
    outFile+=$(echo "$requestFile" | cut -d/ -f3)
    outFile+=".out"
    valgrind --leak-check=yes ../bin/servidor ../Webspace "$requestFile" "$outFile" ./log.txt
done