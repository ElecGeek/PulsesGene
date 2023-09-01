#!/bin/bash

awk '{ for(i=2;i<=NF;i++) { if($i!="deleted") { for(j=i+1;j<=NF;j++) { if($i==$j) { $j="deleted" } } } }; for(i=1;i<=NF;i++) { if($i!="deleted") { printf "%s ",$i }; if (i==NF) { printf "\n" } } }' $1 > $2
sed -i 's/\\ $/\\/g' $2
