#!/bin/bash

# This script is designed to monitor the power usage of a HomeWizard P1 Meter device. It retrieves the recent measurement data from the device's API and sends email notifications if the power generation exceeds a specified threshold. The script is intended to be run as a cron job for continuous monitoring. 

source ./get_token.sh ./get_power_usage.sh
 
# define color codes and log folderfor output messages
R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
N="\e[0m" # Reset to default color

# -s hide progress meter, -S show error messages
RECENT_MEASUREMENT_JSON=$(curl -sS $DEVICE_IP/api/measurement --insecure   -H "Authorization: Bearer $DEVICE_TOKEN"   -H "X-Api-Version: 2")
echo -e "$RECENT_MEASUREMENT_JSON" >> $LOG_FILE

write_to_log() {
    local message="$1"
    local log_file="$2"
    echo -e "$message" >> "$log_file"
}

if [ $? -eq 0 ]; then
    echo "Meter reading at $(date)"
    echo -e "$G $RECENT_MEASUREMENT_JSON"
    
fi



