#!/bin/bash

# Path for .err files
ERR_PATH="/opt/lampp/var/mysql/"
ERR_EXTENSION=".err"

# Path for _log and .log files
LOG_PATH="/opt/lampp/logs/"
LOG_EXTENSIONS=("_log" ".log")

# Function to truncate files
truncate_files() {
    local path=$1
    local extension=$2

    # Find files matching the given path and extension
    files=$(find "$path" -type f -name "*$extension")

    # Truncate each file to 10MB
    for file in $files; do
        truncate -s 10M "$file"
        echo "Truncated $file to 10MB"
    done
}

# Truncate .err files
truncate_files "$ERR_PATH" "$ERR_EXTENSION"

# Truncate _log and .log files
for ext in "${LOG_EXTENSIONS[@]}"; do
    truncate_files "$LOG_PATH" "$ext"
done

## Create a Cron 0 * * * * /bin/bash /opt/BackUp/Script/truncate_files.sh
