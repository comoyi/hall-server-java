#!/bin/bash

# Open browser

which google-chrome > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    nohup google-chrome --new-window 127.0.0.1:30101 127.0.0.1:30102 127.0.0.1:30103 127.0.0.1:30201 127.0.0.1:30301 > /dev/null 2>&1 &
    exit 0
fi

which google-chrome-stable > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    nohup google-chrome-stable --new-window 127.0.0.1:30101 127.0.0.1:30102 127.0.0.1:30103 127.0.0.1:30201 127.0.0.1:30301 > /dev/null 2>&1 &
    exit 0
fi

printf "\033[31mNo browser found, please open it manually.\033[0m\n"
exit 1
