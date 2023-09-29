#!/bin/bash

# Change to the logs directory
cd /opt/lampp/logs

# Loop through log files ending with "_log" and clear their content
for logfile in *_log; do
    > "$logfile"
done
