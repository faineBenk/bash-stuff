#!/bin/bash
echo -n 'print directories:'
read
echo -n 'print exc:'
read exc
declare -i count
count=$(find $REPLY  -type f | wc -l)-$(find $exc  -type f | wc -l)
touch count.file
echo $count >> count.file

