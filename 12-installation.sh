#!/bin/bash

check_root=$(id -u)

if [ $check_root -eq 0 ]; then
    echo "User has root privileage, Hence proceeding with script."
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql installation successful."
else
    echo "mysql installation failed."
fi