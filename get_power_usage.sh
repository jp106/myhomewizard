#!/bin/bash

JSON_STRING="$1"

dnf list installed jq

if [ $? -ne 0 ]; then
    echo "jq is not installed."
    dnf install jq -y
fi

get_power_w() {
    power_w=$(echo "$1" | jq -r '.power_w')
    echo "$power_w"
}

get_power_l1_w() {
    power_l1=$(echo "$1" | jq -r '.power_l1_w')
    echo "$power_l1"
}

get_power_l2_w() {
    power_l2=$(echo "$1" | jq -r '.power_l2_w')
    echo "$power_l2"
}

get_power_l3_w() {
    power_l3=$(echo "$1" | jq -r '.power_l3_w')
    echo "$power_l3"
}
