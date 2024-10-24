#!/bin/bash

clear

# Warna
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
BIYellow='\033[1;93m' # Bold Intense Yellow
NC='\033[0m' # No Color

# Header Menu Backup
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "${BIYellow} \e[44;97;1m               MENU BACKUP & RESTORE              \033[0m ${BIYellow} ${NC}"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo
echo -e "${BlueCyan}Silakan pilih opsi backup atau restore: ${plain}"
echo -e "--------------------------------------------"
echo -e "${green}1) Backup${plain}"
echo -e "${green}2) Restore${plain}"
echo -e "${green}3) Start (strt)${plain}"
echo -e "${green}4) Limit Speed${plain}"
echo -e "${green}5) Auto Backup${plain}"
echo -e "--------------------------------------------"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo

# Membaca input pengguna
echo -e "${BlueCyan}"
read -p "Pilih Nomer >" bro

# Logika untuk setiap pilihan
case $bro in
  1)
    figlet "Backup" | lolcat
    echo -e "${green}Memulai proses backup...${plain}"
    backup
    ;;
  2)
    figlet "Restore" | lolcat
    echo -e "${yellow}Memulai proses restore...${plain}"
    restore
    ;;
  3)
    figlet "Start" | lolcat
    echo -e "${green}Menjalankan service...${plain}"
    strt
    ;;
  4)
    echo -e "${yellow}Mengatur limit kecepatan...${plain}"
    limitspeed
    ;;
  5)
    echo -e "${blue}Menjalankan auto backup...${plain}"
    autobackup
    ;;
  *)
    echo -e "${red}Pilihan tidak valid, silakan coba lagi.${plain}"
    ;;
esac
