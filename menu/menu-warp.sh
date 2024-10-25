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
    echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
    echo -e "\e[44;97;1m               WARP MANAGER"
    echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
    echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
    echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Warp Client${NC}"
    echo -e "  ${ORANGE}[2].${NC}\033[0;36m Uninstall Warp Client${NC}"
    echo -e "  ${ORANGE}[3].${NC}\033[0;36m Restart Warp Client${NC}"
    echo -e "  ${ORANGE}[4].${NC}\033[0;36m Activate Warp Proxy Mode${NC}"
    echo -e "  ${ORANGE}[5].${NC}\033[0;36m Deactivate Warp Proxy Mode${NC}"
    echo -e "  ${ORANGE}[6].${NC}\033[0;36m Install Warp Wireguard${NC}"
    echo -e "  ${ORANGE}[7].${NC}\033[0;36m Warp IPv4${NC}"
    echo -e "  ${ORANGE}[8].${NC}\033[0;36m Warp IPv6${NC}"
    echo -e "  ${ORANGE}[9].${NC}\033[0;36m Warp IPv4 & IPv6${NC}"
    echo -e " ${ORANGE}[10].${NC}\033[0;36m Warp Routing IP${NC}"
    echo -e " ${ORANGE}[11].${NC}\033[0;36m Restart Warp Wireguard${NC}"
    echo -e " ${ORANGE}[12].${NC}\033[0;36m Stop Warp Wireguard${NC}"
    echo -e " ${ORANGE}[13].${NC}\033[0;36m Warp Status${NC}"
    echo -e " ${ORANGE}[14].${NC}\033[0;36m Warp Version${NC}"
    echo -e " ${ORANGE}[15].${NC}\033[0;36m Help${NC}"
    echo -e " ${ORANGE}[16].${NC}\033[0;36m Warp Menu Chinese Special Feature${NC}"
    echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit ${NC}"
    echo -e "\033[1;93m──────────────────────────────────────────\033[0m"
}

# Main function
function main {
    while true; do
        display_menu
        read -p "Select From Options [1 - 16 or x]: " menu
        echo -e ""

        case $menu in
            1)
                echo "Installing Warp Client..."
                bash <(curl -fsSL git.io/warp.sh) install
                ;;
            2)
                echo "Uninstalling Warp Client..."
                bash <(curl -fsSL git.io/warp.sh) uninstall
                ;;
            3)
                echo "Restarting Warp Client..."
                bash <(curl -fsSL git.io/warp.sh) restart
                ;;
            4)
                echo "Activating Warp Proxy Mode..."
                bash <(curl -fsSL git.io/warp.sh) proxy
                ;;
            5)
                echo "Deactivating Warp Proxy Mode..."
                bash <(curl -fsSL git.io/warp.sh) unproxy
                ;;
            6)
                echo "Installing Warp Wireguard..."
                bash <(curl -fsSL git.io/warp.sh) wg
                ;;
            7)
                echo "Activating Warp IPv4..."
                bash <(curl -fsSL git.io/warp.sh) wg4
                ;;
            8)
                echo "Activating Warp IPv6..."
                bash <(curl -fsSL git.io/warp.sh) wg6
                ;;
            9)
                echo "Activating Warp IPv4 & IPv6..."
                bash <(curl -fsSL git.io/warp.sh) wgd
                ;;
            10) 
                echo "Getting Warp Routing IP..."
                bash <(curl -fsSL git.io/warp.sh) wgx
                ;;
            11)
                echo "Restarting Warp Wireguard..."
                bash <(curl -fsSL git.io/warp.sh) rwg
                ;;
            12)
                echo "Stopping Warp Wireguard..."
                bash <(curl -fsSL git.io/warp.sh) dwg
                ;;
            13)
                echo "Getting Warp Status..."
                bash <(curl -fsSL git.io/warp.sh) status
                ;;
            14)
                echo "Getting Warp Version..."
                bash <(curl -fsSL git.io/warp.sh) version
                ;;
            15)
                echo "Getting Help..."
                bash <(curl -fsSL git.io/warp.sh) help
                ;;
            16)
                echo "Opening Warp Menu for Chinese Special Feature..."
                bash <(curl -fsSL git.io/warp.sh) menu
                ;;
            x)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option."
                ;;
        esac
        echo -e "\n"
    done
}

# Run the main function
main
