#!/bin/bash

PORT=$(($RANDOM + 20000))
HOST=`echo $1 | tr "@" "\n" | tail -n 1`

echo $PORT

echo Remote

ssh -n -f $1 "cd $2 ; tar cfp - ./ | nc -l -p $PORT"

sleep 3

echo Local

nc $HOST $PORT | tar xvfp -






