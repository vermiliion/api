#!/bin/bash

# Warna
w="\033[1;37m"
ORANGE="\033[0;33m"
NC="\033[0m" # No Color

# Fungsi untuk menampilkan menu
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
