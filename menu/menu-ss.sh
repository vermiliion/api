#!/bin/bash

# Fetch the server date
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Color Definitions
NC="\e[0m"
RED="\033[0;31m"
BIBlack='\033[1;90m'
BIRed='\033[1;91m'
BIGreen='\033[1;92m'
BIYellow='\033[1;93m'
BIBlue='\033[1;94m'
BIPurple='\033[1;95m'
BICyan='\033[1;96m'
BIWhite='\033[1;97m'
UWhite='\033[4;37m'
On_IPurple='\033[0;105m'
On_IRed='\033[0;101m'
ORANGE='\033[0;33m'

# Exporting Language to UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# Permission Check Function
PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
        echo "Permission Accepted"
        res="Permission Accepted"
    else
        res="Permission Denied!"
    fi
}

PERMISSION

if [ -f /home/needupdate ]; then
    echo -e "${RED}Your script needs to be updated first!${NC}"
    exit 0
elif [ "$res" = "Permission Accepted" ]; then
    echo "Access granted."
else
    echo -e "${RED}Permission Denied!${NC}"
    exit 0
fi

# Check VPS IP
MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear

# Header for Shadowsocks Menu
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "\E[40;1;37m          • SHADOWSHOCKS MENU •          \E[0m"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"

# Menu Options
echo -e " ${BICyan}[${BIWhite}01${BICyan}] Create Account Shadowsocks WS/GRPC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}] Create Trial Shadowsocks WS/GRPC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}] Delete Account Shadowsocks WS/GRPC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}] Renew Shadowsocks Account"
echo -e " ${BICyan}[${BIWhite}05${BICyan}] Check Shadowsocks Login Account"

echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e ""
read -p "Select From Options [ 1 - 5 ]: " menu

# Menu Selection
case $menu in
    1)
        add-ss
        ;;
    2)
        trialss
        ;;
    3)
        del-ss
        ;;
    4)
        renew-ss
        ;;
    5)
        cek-ss
        ;;
    *)
        echo -e "${RED}Invalid selection! Please try again.${NC}"
        sleep 1
        clear
        ;;
esac
