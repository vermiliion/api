#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"

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

# Color Definitions
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

MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "             MENU SHADOWSHOCKS            $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}1.${NC} \033[0;36m Create Account Shadowshocks WS/GRPC${NC}"
echo -e "  ${ORANGE}2.${NC} \033[0;36m Create Trial Shadowshocks WS/GRPC${NC}"
echo -e "  ${ORANGE}3.${NC} \033[0;36m Delete Account Shadowsocks WS/GRPC${NC}"
echo -e "  ${ORANGE}4.${NC} \033[0;36m Renew Shadowsocks Account${NC}"
echo -e "  ${ORANGE}5.${NC} \033[0;36m Check Shadowsocks login Account${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 5 ] : " menu
case $menu in
1)
    addss
    ;;
2)
    trialss
    ;;
3)
    delss
    ;;
4)
    renewss
    ;;
5)
    cekss
    ;;
 
*)
    menu
    ;;
esac
