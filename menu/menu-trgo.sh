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

PERMISSION

if [ -f /home/needupdate ]; then
    echo -e "${RED}Your script needs to be updated first!${NC}"
    exit 0
elif [ "$res" = "Permission Accepted..." ]; then
    echo -ne
else
    echo -e "${RED}Permission Denied!${NC}"
    exit 0
fi

# Check VPS IP
MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear

# Header for Trojan Go Menu
echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"
echo -e "\E[40;1;37m        • TROJAN Go MENU •         \E[0m"
echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"

# Menu Options
echo -e " ${BICyan}[${BIWhite}01${BICyan}] Create Account Trojan Go"
echo -e " ${BICyan}[${BIWhite}02${BICyan}] Trial Account Trojan Go"
echo -e " ${BICyan}[${BIWhite}03${BICyan}] Extend Account Trojan Go Active Life"
echo -e " ${BICyan}[${BIWhite}04${BICyan}] Delete Account Trojan Go"
echo -e " ${BICyan}[${BIWhite}05${BICyan}] Check User Login Trojan Go"
echo -e ""
echo -e " ${BICyan}[${BIWhite}0${BICyan}] Back to Menu"
echo -e ""
echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"
echo -e "Press x or [ Ctrl+C ] • To Exit"
echo ""

# User Input for Menu Selection
read -p " Select menu : " opt
echo -e ""

# Menu Selection
case $opt in
    1) clear ; addtrgo ;;
    2) clear ; trialtrojango ;;
    3) clear ; renewtrgo ;;
    4) clear ; deltrgo ;;
    5) clear ; cektrgo ;;
    0) clear ; menu ;;
    x) exit ;;
    *) echo -e "${RED}Invalid selection! Please try again.${NC}" ; sleep 1 ; clear ; ;;
esac
