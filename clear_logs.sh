#!/bin/bash

# XAMPP/LAMPP Apache logs directory
logs_directory="/opt/lampp/logs"

# Truncate access logs
echo "Truncating access logs..."
truncate -s 0 "${logs_directory}/access_log"

# Truncate error logs
echo "Truncating error logs..."
truncate -s 0 "${logs_directory}/error_log"

# Truncate logs with a specific pattern (e.g., alumni-*-access.log)
echo "Truncating domain-specific access logs..."
for log_file in "${logs_directory}"/*-access.log; do
  truncate -s 0 "${log_file}"
done

# Truncate php_error_log
echo "Truncating php_error_log..."
truncate -s 0 "${logs_directory}/php_error_log"

# Truncate alumni-web.com-error.log
echo "Truncating alumni-web.com-error.log..."
truncate -s 0 "${logs_directory}/alumni-web.com-error.log"

# Truncate ssl_request_log
echo "Truncating ssl_request_log..."
truncate -s 0 "${logs_directory}/ssl_request_log"

echo "Logs truncated successfully!"
