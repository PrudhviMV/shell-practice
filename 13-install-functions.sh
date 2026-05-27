#!/bin/bash

check_root=$(id -u)

if [ $check_root -ne 0 ]; then
    echo "User doesn't has root privileage, Hence not proceeding with script."
    echo "Run this script with root user"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo "$2 installation successful."
    else
        echo "$2 installation failed."
    fi
}

dnf install mysql -y
VALIDATE $? mysql

dnf install nginx -y
VALIDATE $? Nginx

dnf install python -y
VALIDATE $? python