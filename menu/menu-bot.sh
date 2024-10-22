#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m"

# Fungsi BURIQ
BURIQ () {
    curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register > /root/tmp
    data=( $(cat /root/tmp | grep -E "^### " | awk '{print $2}') )
    for user in "${data[@]}"; do
        exp=$(grep -E "^### $user" "/root/tmp" | awk '{print $3}')
        d1=$(date -d "$exp" +%s)
        d2=$(date -d "$biji" +%s)
        exp2=$(( (d1 - d2) / 86400 ))
        if [[ "$exp2" -le "0" ]]; then
            echo $user > /etc/.$user.ini
        else
            rm -f /etc/.$user.ini > /dev/null 2>&1
        fi
    done
    rm -f /root/tmp
}

# Mengambil IP
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

# Fungsi Bloman
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

# Fungsi PERMISSION
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

red='\e[1;31m'
green='\e[1;32m'

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

# Warna lainnya
BIBlack='\033[1;90m'
BIRed='\033[1;91m'
BIGreen='\033[1;92m'
BIYellow='\033[1;93m'
BIBlue='\033[1;94m'
BIPurple='\033[1;95m'
BICyan='\033[1;96m'
BIWhite='\033[1;97m'
NC='\e[0m'

# Menu utama
clear
echo -e " ${BICyan}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${BIGreen}                   BOT MANAGER                ${NC}"
echo -e " ${BICyan}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${BIGreen}[1]. Install BOT CYBERVPN${NC}"
echo -e "  ${BIGreen}[2]. Restart BOT CYBERVPN${NC}"
echo -e "  ${BIGreen}[3]. Stop BOT CYBERVPN${NC}"
echo -e "  ${BIGreen}[4]. Uninstall BOT CYBERVPN${NC}"
echo -e " ${BICyan}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${BIGreen}[5] Install Bot KYT${NC}"
echo -e "  ${BIGreen}[6] Hapus Bot KYT${NC}"
echo -e "  ${BIGreen}[7] Stop Bot KYT${NC}"
echo -e "  ${BIGreen}[8] Restart Bot KYT${NC}"
echo -e "  ${BIGreen}[9] Install Bot KYT For Public${NC}"
echo -e "  ${BIGreen}[10] Install Bot Bansos${NC}"
echo -e ""
echo -e "  ${BIGreen}[x]. Exit${NC}"
echo -e " ${BICyan}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
read -p "  Select From Options [1 - 10 or x] : " menu
case $menu in
1) clear; bot2 ;;
2) clear; restart-bot2 ;;
3) clear; stop-bot2 ;;
4) clear; del-bot2 ;;
5) clear; add-bot ;;
6) clear; hapus-bot ;;
7) clear; stop-bot ;;
8) clear; restart-bot ;;
9) clear; add-bot-bersama ;;
10) clear; bot-bansos ;;
x) exit ;;
*) echo "Invalid option, please select a valid number." ;;
esac
