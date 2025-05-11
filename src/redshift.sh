#!/bin/bash 
base=6500 # default screen temp
night=2500
size=50
step=$(((base-night)/size))
echo $step
while [ 1==1 ]; do 
	time=$(date +%H)
	current=$base 
	if [ $time -gt 19 ];then 
		echo "Starting Redshift"
		redshift -x
		for ((i = 0; i < size/3; i++)); do
			redshift -o -O $((current-(step*(i+1))))
			echo "index $i/$((size/3))"
			sleep 5
			
		done
	else
		echo "Stopping Redshift"
		redshift -x
	fi
	echo "Sleeping for 1 Minute"
	sleep 60
done
