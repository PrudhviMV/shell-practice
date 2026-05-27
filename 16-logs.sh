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

log_dir="/var/log/shell-script"
script_name=$(echo "$0" | cut -d "." -f 1 )
log_file="$log_dir/$script_name.log"

mkdir -p $log_dir
echo -e "Script started at $(date)"

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo "$2 installation successful."
    else
        echo "$2 installation failed."
    fi
}

dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$log_file
    VALIDATE $? mysql
else
    echo -e " $G mysql is present on VM, Hence skipping $N. "
fi

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$log_file
    VALIDATE $? nginx 
else
    echo -e " $G nginx is present on VM, Hence skipping $N. "
fi


dnf list installed python3 &>>$log_file
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$log_file
    VALIDATE $? python3
else
    echo -e " $G python3 is present on VM, Hence skipping $N. "
fi