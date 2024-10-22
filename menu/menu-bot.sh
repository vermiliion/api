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
function display_menu {
    echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
    echo -e "               BOT MANAGER"
    echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
    echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
    echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install BOT CYBERVPN${NC}"
    echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart BOT CYBERVPN${NC}"
    echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop BOT CYBERVPN${NC}"
    echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall BOT CYBERVPN${NC}"
    echo -e " ${ORANGE}[5].${NC}\033[0;36m Install Bot KYT${NC}"
    echo -e " ${ORANGE}[6].${NC}\033[0;36m Hapus Bot KYT${NC}"
    echo -e " ${ORANGE}[7].${NC}\033[0;36m Stop Bot KYT${NC}"
    echo -e " ${ORANGE}[8].${NC}\033[0;36m Restart Bot KYT${NC}"
    echo -e " ${ORANGE}[9].${NC}\033[0;36m Install Bot KYT For Public${NC}"
    echo -e " ${ORANGE}[10].${NC}\033[0;36m Install Bot Bansos${NC}"
    echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit ${NC}"
    echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
}

# Fungsi utama
function main {
    while true; do
        display_menu
        read -p "Select From Options [ 1 - 10 or x ] : " menu
        echo -e ""

        case $menu in
            1)
                echo "Installing BOT CYBERVPN..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/bot2 && chmod +x bot2 && ./bot2
                ;;
            2)
                echo "Restarting BOT CYBERVPN..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/restart-bot2 && chmod +x restart-bot2 && ./restart-bot2
                ;;
            3)
                echo "Stopping BOT CYBERVPN..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/stop-bot2 && chmod +x stop-bot2 && ./stop-bot2
                ;;
            4)
                echo "Uninstalling BOT CYBERVPN..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/del-bot2 && chmod +x del-bot2 && ./del-bot2
                ;;
            5)
                echo "Installing Bot KYT..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/add-bot && chmod +x add-bot && ./add-bot
                ;;
            6)
                echo "Hapus Bot KYT..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/hapus-bot && chmod +x hapus-bot && ./hapus-bot
                ;;
            7)
                echo "Stopping Bot KYT..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/stop-bot && chmod +x stop-bot && ./stop-bot
                ;;
            8)
                echo "Restarting Bot KYT..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/restart-bot && chmod +x restart-bot && ./restart-bot
                ;;
            9)
                echo "Installing Bot KYT For Public..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/add-bot-bersama && chmod +x add-bot-bersama && ./add-bot-bersama
                ;;
            10)
                echo "Installing Bot Bansos..."
                wget -q https://raw.githubusercontent.com/vermiliion/api/main/botol/bot-bansos && chmod +x bot-bansos && ./bot-bansos
                ;;
            x)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Pilihan tidak valid."
                ;;
        esac
        echo -e "\n"
    done
}

# Jalankan fungsi utama
main
