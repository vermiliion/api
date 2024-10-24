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

# Header for SSH Menu
echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"
echo -e "\E[40;1;37m          • SSH MENU •          \E[0m"
echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"

# Menu Options
echo -e " ${BICyan}[${BIWhite}01${BICyan}] Create SSH & OpenVPN Account"
echo -e " ${BICyan}[${BIWhite}02${BICyan}] Trial Account SSH & OpenVPN"
echo -e " ${BICyan}[${BIWhite}03${BICyan}] Renew SSH & OpenVPN Account"
echo -e " ${BICyan}[${BIWhite}04${BICyan}] Delete SSH & OpenVPN Account"
echo -e " ${BICyan}[${BIWhite}05${BICyan}] Check User Login SSH & OpenVPN"
echo -e " ${BICyan}[${BIWhite}06${BICyan}] List Member SSH & OpenVPN"
echo -e " ${BICyan}[${BIWhite}07${BICyan}] Delete User Expired SSH & OpenVPN"
echo -e " ${BICyan}[${BIWhite}08${BICyan}] Set up Autokill SSH"
echo -e " ${BICyan}[${BIWhite}09${BICyan}] Check Users Who Do Multi Login SSH"
echo -e " ${BICyan}[${BIWhite}10${BICyan}] Lock SSH Account"
echo -e " ${BICyan}[${BIWhite}11${BICyan}] Unlock SSH Account"

echo -e "${BICyan} ─────────────────────────────────────────────────────${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu :  " opt
echo -e ""

# Menu Selection
case $opt in
    1) clear ; usernew ; exit ;;
    2) clear ; trial ; exit ;;
    3) clear ; renew ; exit ;;
    4) clear ; hapus ; exit ;;
    5) clear ; cek ; exit ;;
    6) clear ; member ; exit ;;
    7) clear ; delete ; exit ;;
    8) clear ; autokill ; exit ;;
    9) clear ; ceklim ; exit ;;
    10) clear ; lock ; exit ;;
    11) clear ; unlock ; exit ;;
    0) clear ; menu ; exit ;;
    x) exit ;;
    *) echo -e "${RED}Invalid selection! Please try again.${NC}" ; sleep 1 ; clear ; ;;
esac
