#!/bin/bash
# check for long running cockpit sessions and kill em 
source ~/.bash_profile
export PATH=$(dirname $0):$PATH

MAXTIME="14400"

for xPID in `/usr/bin/pidof cockpit-bridge`
do
	RUNTIMEs=`/usr/bin/ps -o etimes $xPID`
	RUNTIME=`/usr/bin/echo $RUNTIMEs|/usr/bin/awk '{print $2}'`
	if [[ $RUNTIME -gt $MAXTIME ]]
	then echo $RUNTIME
		echo "KILLING Long running cockpit session.."
		/usr/bin/killall cockpit-bridge
		break;
	else
		echo "Too Soon"
	echo $RUNTIME
	fi
done
