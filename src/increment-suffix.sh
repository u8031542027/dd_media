#!/bin/sh

if [ "${1}" = "" ] || [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then

    echo "Usage: increment-suffix [BASE_FILENAME]" 
    echo " "
    echo "increment-suffix of the filename"
    echo " "
    echo "options:"
    echo "  -h, help          show this help message and exit"
    echo "  BASE_FILENAME     filename without the numerical index"
    
    exit 0
fi

BASE_FILENAME="${1}"
DIR="${2}"

if [ "${DIR}" = "" ]; then
    DIR=$(pwd)
fi

last_file=$(ls "${DIR}" | grep "${BASE_FILENAME}" | tail -n 1)

if [ ! "${last_file}" = "" ]; then
    last_file_number="${last_file##*$BASE_FILENAME}"
    last_file_number="${last_file##*_}"
    amount_of_digits=5
    current_file_number=$((last_file_number+1))
    current_file_number=$(printf "%0${amount_of_digits}d" "${current_file_number}")
else
    current_file_number="00001"
fi

echo "${current_file_number}"

exit 0




