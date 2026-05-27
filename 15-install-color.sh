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

dnf list installed mysql
if [ $? -eq 0 ]; then
    echo -e " $G mysql is present on VM, Hence skipping $N. "
else
    dnf install mysql -y
    VALIDATE $? mysql
fi

dnf install nginx -y
if [ $? -eq 0 ]; then
    echo -e " $G nginx is present on VM, Hence skipping $N. "
else
    dnf install nginx -y
    VALIDATE $? nginx
fi


dnf install python -y
if [ $? -eq 0 ]; then
    echo -e " $G python is present on VM, Hence skipping $N. "
else
    dnf install python -y
    VALIDATE $? python
fi