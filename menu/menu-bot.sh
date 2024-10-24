#!/bin/bash

clear

# Warna
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
BIYellow='\033[1;93m'  # Bold Intense Yellow
NC='\033[0m'           # No Color

# Header Menu BOT MANAGER
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "${BIYellow} \e[44;97;1m                MENU BOT MANAGER                   ${NC}"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo

# Fetching server date
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Function to check permissions
PERMISSION() {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
        echo -e "${green}Permission Accepted${NC}"
        res="Permission Accepted"
    else
        echo -e "${red}Permission Denied!${NC}"
        res="Permission Denied"
    fi
}

# Check for permissions
PERMISSION

# Check if update is needed
if [ -f /home/needupdate ]; then
    echo -e "${red}Your script needs to be updated first!${NC}"
    exit 0
elif [ "$res" != "Permission Accepted" ]; then
    echo -e "${red}Permission Denied!${NC}"
    exit 0
else
    echo -e "${green}Access granted.${NC}"
fi

# Function to display the menu
function display_menu {
    echo -e "${yellow} ─────────────────────────────────────────────────────${plain}"
    echo -e "${green}Silakan pilih opsi:${plain}"
    echo -e "--------------------------------------------"
    echo -e "${green}1) Install BOT CYBERVPN${plain}"
    echo -e "${green}2) Restart BOT CYBERVPN${plain}"
    echo -e "${green}3) Stop BOT CYBERVPN${plain}"
    echo -e "${green}4) Uninstall BOT CYBERVPN${plain}"
    echo -e "${green}5) Install Bot KYT${plain}"
    echo -e "${green}6) Hapus Bot KYT${plain}"
    echo -e "${green}7) Stop Bot KYT${plain}"
    echo -e "${green}8) Restart Bot KYT${plain}"
    echo -e "${green}9) Install Bot KYT For Public${plain}"
    echo -e "${green}10) Install Bot Bansos${plain}"
    echo -e "${green}x) Exit${plain}"
    echo -e "${yellow} ─────────────────────────────────────────────────────${plain}"
    echo
}

# Main function
function main {
    while true; do
        display_menu
        read -p "Pilih Nomor └╼>>> " menu
        echo -e ""

        case $menu in
            1)
                echo -e "${green}Installing BOT CYBERVPN...${plain}"
                bot2
                ;;
            2)
                echo -e "${green}Restarting BOT CYBERVPN...${plain}"
                restart-bot2
                ;;
            3)
                echo -e "${green}Stopping BOT CYBERVPN...${plain}"
                stop-bot2
                ;;
            4)
                echo -e "${green}Uninstalling BOT CYBERVPN...${plain}"
                del-bot2
                ;;
            5)
                echo -e "${green}Installing Bot KYT...${plain}"
                add-bot
                ;;
            6)
                echo -e "${green}Hapus Bot KYT...${plain}"
                hapus-bot
                ;;
            7)
                echo -e "${green}Stopping Bot KYT...${plain}"
                stop-bot
                ;;
            8)
                echo -e "${green}Restarting Bot KYT...${plain}"
                restart-bot
                ;;
            9)
                echo -e "${green}Installing Bot KYT For Public...${plain}"
                add-bot-bersama
                ;;
            10)
                echo -e "${green}Installing Bot Bansos...${plain}"
                bot-bansos
                ;;
            x)
                echo -e "${green}Exiting...${plain}"
                exit 0
                ;;
            *)
                echo -e "${red}Pilihan tidak valid, silakan coba lagi.${plain}"
                ;;
        esac
        echo -e "\n"
    done
}

# Execute main function
main
