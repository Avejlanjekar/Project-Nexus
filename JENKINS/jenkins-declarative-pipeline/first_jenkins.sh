#!/bin/bash

Name=$1
LastName=$2
show=$3

if [ "$show" = "true" ]; then
	echo "Hello $Name $LastName"
else
	echo "if u want to see name and last name , give 3 paramaters and third param as true"
fi
