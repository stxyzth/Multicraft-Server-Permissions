#!/bin/bash
filename='chown.txt'

ls -l | awk '{ print $9 }' | awk -F '[^0-9]+' '{OFS=" "; for(i=1; i<=NF; ++i) if ($i != "") print($i)}' > chown.txt

sleep 6

while read p; do
    `chown -R mc$p:mc$p server$p/`
done < $filename

rm chown.txt
