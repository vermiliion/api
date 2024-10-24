#!/bin/bash

# Color Definitions
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # Underlined White
NC='\e[0m'                # No Color

# Exporting Language to UTF-8
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# Checking VPS IP
MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear

# Header for Menu SETTING
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m          • MENU SETTING •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

# Menu Options
echo -e "     [${BICyan}01${NC}] ${BICyan}Panel Domain      "
echo -e "     [${BICyan}02${NC}] ${BICyan}Change Port All Account      "
echo -e "     [${BICyan}03${NC}] ${BICyan}Webmin Menu      "
echo -e "     [${BICyan}04${NC}] ${BICyan}Speedtest VPS   "
echo -e "     [${BICyan}05${NC}] ${BICyan}About Script     "
echo -e "     [${BICyan}06${NC}] ${BICyan}Set Auto Reboot   "
echo -e "     [${BICyan}07${NC}] ${BICyan}Restart All Service"
echo -e "     [${BICyan}08${NC}] ${BICyan}Change Banner"
echo -e "     [${BICyan}09${NC}] ${BICyan}Cek Bandwidth"
echo -e "     [${BICyan}10${NC}] ${BICyan}Setting Auto Reboot"
echo -e ""
echo -e " ${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite} Exit${NC}"
echo ""

# Read user input
read -p " Select menu: " opt
echo -e ""

# Handle user input
case $opt in
    1) clear; menu-domain; exit ;;
    2) clear; port-change; exit ;;
    3) clear; menu-webmin; exit ;;
    4) clear; speedtest; exit ;;
    5) clear; about; exit ;;
    6) clear; auto-reboot; exit ;;
    7) clear; restart; exit ;;
    8) clear; nano /etc/issue.net; exit ;; # Change SSH/VPN banner
    9) clear; bw; exit ;;
    10) clear; jam; exit ;;
    0) clear; menu; exit ;;
    x) exit ;;
    *) echo -e "${BIRed}Anda salah tekan${NC}" ; sleep 1 ; menu-set ;;
esac
