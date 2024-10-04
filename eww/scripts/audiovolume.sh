#! /bin/bash

volume="$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))"
echo "${volume::-1}"
