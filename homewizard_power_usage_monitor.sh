#!/bin/bash

# This script is designed to monitor the power usage of a HomeWizard P1 Meter device. It retrieves the recent measurement data from the device's API and sends email notifications if the power generation exceeds a specified threshold. The script is intended to be run as a cron job for continuous monitoring. 

source ./get_token.sh
# define color codes and log folderfor output messages
R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
N="\e[0m" # Reset to default color

# -s hide progress meter, -S show error messages
RECENT_MEASUREMENT_JSON=$(curl -sS https://192.168.1.240/api/measurement --insecure   -H "Authorization: Bearer $DEVICE_TOKEN"   -H "X-Api-Version: 2")


if [ $? -eq 0 ]; then
    echo "Meter reading at $(date)"
    echo -e "$G $RECENT_MEASUREMENT_JSON" 
fi



