#!/bin/bash

MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear

# Color Definitions
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
BIYellow='\033[1;93m'  # Bold Intense Yellow
NC='\033[0m'           # No Color

# Header Menu DOMAIN
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "${BIYellow} \e[44;97;1m               • DOMAIN MENU •                     ${NC}"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "" 
echo -e " ${green}[\e[36m•1\e[0m]${plain} CHANGE DOMAIN VPS"
echo -e " ${green}[\e[36m•2\e[0m]${plain} Renew Certificate DOMAIN"
echo -e ""
echo -e " ${red}[\e[31m•0\e[0m]${plain} ${red}BACK TO MENU${NC}"
echo -e   ""
echo -e   "${yellow}Press x or [ Ctrl+C ] • To-Exit${NC}"
echo -e   ""
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e ""

# Read user input
read -p " Select menu: " opt
echo -e ""

# Handle user input
case $opt in
    1) clear; add-host ;;
    2) clear; certv2ray ;;
    0) clear; menu ;;
    x) exit ;;
    *) echo -e "${red}Anda salah tekan${NC}" ; sleep 1 ; menu-domain ;;
esac
