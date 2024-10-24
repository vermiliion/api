#!/bin/bash

# Fetch the server date
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Color Definitions
NC="\e[0m"
RED="\033[0;31m"

BURIQ () {
    curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
        exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
        d1=(`date -d "$exp" +%s`)
        d2=(`date -d "$biji" +%s`)
        exp2=$(( (d1 - d2) / 86400 ))
        if [[ "$exp2" -le "0" ]]; then
            echo $user > /etc/.$user.ini
        else
            rm -f /etc/.$user.ini > /dev/null 2>&1
        fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
    if [ -f "/etc/.$Name.ini" ]; then
        CekTwo=$(cat /etc/.$Name.ini)
        if [ "$CekOne" = "$CekTwo" ]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
        Bloman
    else
        res="Permission Denied!"
    fi
    BURIQ
}

# Color Functions
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# Check Permission
PERMISSION

if [ -f /home/needupdate ]; then
    red "Your script needs to be updated first!"
    exit 0
elif [ "$res" = "Permission Accepted..." ]; then
    echo -ne
else
    red "Permission Denied!"
    exit 0
fi

# Check VPS IP
MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear

# Header for Trojan Menu
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m          • MENU TROJAN •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "     [\e[36m01\e[0m] Create Account Trojan    "
echo -e "     [\e[36m02\e[0m] Trial Account Trojan     "
echo -e "     [\e[36m03\e[0m] Extending Account Trojan Active Life      "
echo -e "     [\e[36m04\e[0m] Delete Account Trojan     "
echo -e "     [\e[36m05\e[0m] Check User Login Trojan     "
echo -e ""
echo -e " \e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "     Press x or [ Ctrl+C ] • To-${BIWhite} Exit${NC}"
echo -e ""

# User Input for Menu Selection
read -p " Select menu : " opt
echo -e ""

# Menu Selection
case $opt in
    1) clear ; add-tr ;;
    2) clear ; trialtrojan ;;
    3) clear ; renew-tr ;;
    4) clear ; del-tr ;;
    5) clear ; cek-tr ;;
    0) clear ; menu ;;
    x) exit ;;
    *) echo -e "${RED}Invalid selection! Please try again.${NC}" ; sleep 1 ; clear ; ;;
esac
