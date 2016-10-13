#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line

cat dn.txt | while read h
do 
  ssh $h "cd $HOME/impala-tpcds-kit; ./gen-web.sh" < /dev/null &
done
