#!/usr/bin/env bash


ihexarray=( $(find . -type f -name "*.ihex") )
for i in "${ihexarray[@]}"
do
  out=$(echo $i | sed s/.ihex//)
  xxd -r -p $i $out
  perm=$(stat -c "%a" $i)
  own=$(stat -c "%U:%G" $i)
  chmod $perm $out
  chown $own $out
  mkdir ihex
  mv $i ./ihex
done

hexarray=( $(find . -type f -name "*.HEX") )
for i in "${hexarray[@]}"
do
  out=$(echo $i | sed s/.ihex//)
  xxd -r -p $i $out
  perm=$(stat -c "%a" $i)
  own=$(stat -c "%U:%G" $i)
  chmod $perm $out
  chown $own $out
  mkdir hex
  mv $i ./hex
done

echo "your files have been converted !"
