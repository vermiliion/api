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
function show_menu() {
    clear
    echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
    echo -e " ${w}            NOOBZVPNS MANAGER             ${NC}"
    echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
    echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Noobzvpns${NC}"
    echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart Noobzvpns${NC}"
    echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop Noobzvpns${NC}"
    echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall Noobzvpns${NC}"
    echo -e ""
    echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit${NC}"
    echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
}

# Fungsi untuk install Noobzvpns
function install_noobzvpns() {
    clear
    echo "Installing Noobzvpns..."
    git clone https://github.com/noobz-id/noobzvpns.git || { echo "Failed to clone repository"; exit 1; }
    cd noobzvpns/ || { echo "Failed to enter the directory"; exit 1; }
    chmod +x install.sh
    ./install.sh || { echo "Failed to install Noobzvpns"; exit 1; }
}

# Fungsi untuk restart Noobzvpns
function restart_noobzvpns() {
    clear
    echo "Restarting Noobzvpns..."
    systemctl restart noobzvpns.service || { echo "Failed to restart Noobzvpns"; exit 1; }
    echo "Noobzvpns restarted successfully"
}

# Fungsi untuk stop Noobzvpns
function stop_noobzvpns() {
    clear
    echo "Stopping Noobzvpns..."
    systemctl stop noobzvpns.service || { echo "Failed to stop Noobzvpns"; exit 1; }
    echo "Noobzvpns stopped successfully"
}

# Fungsi untuk uninstall Noobzvpns
function uninstall_noobzvpns() {
    clear
    echo "Uninstalling Noobzvpns..."
    git clone https://github.com/noobz-id/noobzvpns.git || { echo "Failed to clone repository"; exit 1; }
    cd noobzvpns/ || { echo "Failed to enter the directory"; exit 1; }
    chmod +x uninstall.sh
    ./uninstall.sh || { echo "Failed to uninstall Noobzvpns"; exit 1; }
}

# Main logic
while true; do
    show_menu
    read -p "  Select From Options [ 1 - 4 or x ] : " menu

    case $menu in
        1) install_noobzvpns ;;
        2) restart_noobzvpns ;;
        3) stop_noobzvpns ;;
        4) uninstall_noobzvpns ;;
        x) clear; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac

    read -p "Press [Enter] to continue..."
done
