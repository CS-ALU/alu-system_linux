#!/bin/bash
FILES="./tests/elf_files/*"
i=0
for f in $FILES
do
  diff <(./hobjdump $f) <(objdump -sf $f) > /dev/null
  if [ $? -ne 0 ]
  then
    echo $f
  fi
done
