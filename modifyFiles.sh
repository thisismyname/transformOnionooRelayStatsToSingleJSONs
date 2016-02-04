#!/bin/bash
start_dir="/home/logstash/onionoo/"
for i in $( find $start_dir -iname "*.txt" ) ; do
	tracked_time=$( head -5 $i | grep "relays_published" | sed 's/"relays_published":"\([ -:0-9]*\)",/\1/' )
	grep "{\"nickname\":\"" $i | sed "s/{\(.*\),/{\"relay_published\":\"$tracked_time\",\1/" > ${i}_new
done
