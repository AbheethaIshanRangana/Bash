#!/bin/bash

#
# This bash script can use to create user accounts
# in RedHat based Linux enviroments.
#

#
# Version	: v0.1
# Author	: D. M. Abheetha Ishan Rangana
# Email		: d.m.abheethaishan@gmail.com
# Website	: www.abheethaishan.com
#

# Variables
DATE=`date +%Y-%m-%d`
TIME=`date +%H:%M`
SHELL=''

# Functions
create_user(){
	echo "INPUT::Enter Username:"
	read U_NAME
	echo "INPUT::Disable Shell Login ? [Y/N]"
	read DSL
	if [ "${DSL}" == 'Y' ]
	then
		SHELL='/sbin/nologin'
		echo "INFO::Creating User Account."
        	sudo useradd -s ${SHELL} ${U_NAME}
	elif [ "${DSL}" == 'N' ]
	then
		SHELL='/bin/bash'
		echo "INFO::Creating User Account."
        	sudo useradd -s ${SHELL} ${U_NAME}
	else
		echo "INFO::Invalid Option. Please select correct option"
		create_user
	fi
	echo "INFO::User Account Created."
}

delete_user(){
	echo "INPUT::Enter Username:"
	read U_NAME
	sudo userdel -f ${U_NAME}
}

# Main
clear

echo "#############################################"
echo "           Manage User Accounts		   "
echo "#############################################"
echo "     DATE:${DATE} 	TIME:${TIME}       "
echo "---------------------------------------------"
echo "INFO::Option:"
echo "	1 - Create User Account"
echo "	2 - Delete User Account"
echo "INPUT::Select Option:"
read OPTION

# switch
case ${OPTION} in
	1) echo "INFO::Create User Account."
	   create_user
	   ;;
	2) echo "INFO::Delete User Account."
	   delete_user
           ;;
	*) echo "INFO::Invalid Oprion."
	   ;;
esac

echo "---------------------------------------------"
echo "#############################################"
