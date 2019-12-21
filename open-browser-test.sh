#!/bin/bash

# Open browser

browser=

which google-chrome > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    browser=google-chrome
else
    which google-chrome-stable > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        browser=google-chrome-stable
    fi
fi

if [[ ${browser} == "" ]]; then
    printf "\033[31mNo browser found, please open it manually.\033[0m\n"
    exit 1
fi

nohup "${browser}" --new-window \
    127.0.0.1:30101 \
    127.0.0.1:30102 \
    127.0.0.1:30103 \
    127.0.0.1:30201 \
    127.0.0.1:30301 \
    127.0.0.1:30501 \
    > /dev/null 2>&1 &

exit 0
