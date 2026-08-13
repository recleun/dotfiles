#! /bin/bash
if [[ $1 -eq 1 ]]; then
    date "+%Y/%m/%d, %A, %H:%M"
elif [[ $1 -eq 2 ]]; then
    date "+%m/%d, %H:%M"
else
    date "+%H:%M"
fi

echo done
