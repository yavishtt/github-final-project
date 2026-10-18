#!/bin/bash
# Simple Interest Calculator
# Author: yavishtt; based on the IBM course example by Upkar Lidder.
# Input fields:
#   principal: initial amount of money (non-negative number).
#   rate: annual rate of interest as a percentage, e.g. 5 means 5%.
#   time: time period in years (non-negative number).
# Output: simple interest = principal * rate * time / 100.

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period in years: " time

for value in "$principal" "$rate" "$time"; do
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: enter non-negative whole numbers or decimals." >&2
        exit 1
    fi
done

# awk is available on macOS and supports decimal arithmetic.
simple_interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "%.2f", p * r * t / 100 }')
printf 'The simple interest is: %s\n' "$simple_interest"
