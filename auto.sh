#!/usr/bin/env bash

HOST_FILE="hosts.txt"
CMD_FILE="cmd.txt"
USER="pi"

while read HOST
do
  echo "--------  "$HOST"  ----------"

  while read CMD
  do
    echo $CMD
    ssh $USER@$HOST $CMD&
    wait
    echo ""
  done < "$CMD_FILE"

  echo "-----------------------------"

done < "$HOST_FILE"
