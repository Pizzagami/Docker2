#!/bin/sh
ps > probe.txt
grep "/usr/bin/telegraf" probe.txt > status.txt
if [ -s status.txt ]; then
	exit 0
fi
exit 1

