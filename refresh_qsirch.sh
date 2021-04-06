#!/bin/sh

filename=/share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/inotifywait.log
IFS=$'\n'

log_lines=`wc -l < $filename`
start_line=`head -n 1 /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/inotifywait_start_line 2>/dev/null`
if [[ "$start_line" == '' ]]; then
	start_line=1
else
	start_line=$(( $start_line + 1))
fi

if [[ "($start_line - 1)" == "$log_lines" ]]; then
	exit 0
fi

echo "$log_lines" > /share/CACHEDEV2_DATA/WillBackupDataDir2/autorun/inotifywait_start_line

for next in `tail -n +$start_line $filename | sort | uniq`; do
	if [[ "$next" == *" ISDIR "* ]]; then
		continue
	fi
	line=`echo $next | sed 's/ ATTRIB //'`
	#echo ï$lie
	if [ -f "$line" ]; then
		mv -f $line $line
	fi
done
exit 0
