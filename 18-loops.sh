#!/bin/bash

#colour codes
Bk="\e[30m"	
R="\e[31m"	
G="\e[32m"	
Y="\e[33m"	
B="\e[34m"	
P="\e[35m"	
C="\e[36m"	
W="\e[37m"	

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

# $@ -> consider all args

for package in $@
do
    #check whether package is installed or not
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo $package is installed
    fi
done