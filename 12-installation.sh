#!/bin/bash

check_root=$(id -u)

if [ $check_root -ne 0 ]; then
    echo "User doesn't has root privileage, Hence not proceeding with script."
    echo "Run this script with root user"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql installation successful."
else
    echo "mysql installation failed."
fi