#!/bin/bash

# Warna
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

# Fungsi untuk menampilkan menu
function display_menu {
    echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
    echo -e "               WARP MANAGER"
    echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
    echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
    echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Warp Client${NC}"
    echo -e "  ${ORANGE}[2].${NC}\033[0;36m Uninstall Warp Client${NC}"
    echo -e "  ${ORANGE}[3].${NC}\033[0;36m Restart Warp Client${NC}"
    echo -e "  ${ORANGE}[4].${NC}\033[0;36m Aktifkan Warp Mode Proxy${NC}"
    echo -e "  ${ORANGE}[5].${NC}\033[0;36m Matikan Warp Mode Proxy${NC}"
    echo -e "  ${ORANGE}[6].${NC}\033[0;36m Install Warp Wireguard${NC}"
    echo -e "  ${ORANGE}[7].${NC}\033[0;36m Warp Ipv4${NC}"
    echo -e "  ${ORANGE}[8].${NC}\033[0;36m Warp Ipv6${NC}"
    echo -e "  ${ORANGE}[9].${NC}\033[0;36m Warp Ipv4 & Ipv6${NC}"
    echo -e " ${ORANGE}[10].${NC}\033[0;36m Warp Routing IP${NC}"
    echo -e " ${ORANGE}[11].${NC}\033[0;36m Restart Warp Wireguard${NC}"
    echo -e " ${ORANGE}[12].${NC}\033[0;36m Matikan Warp Wireguard${NC}"
    echo -e " ${ORANGE}[13].${NC}\033[0;36m Warp Status${NC}"
    echo -e " ${ORANGE}[14].${NC}\033[0;36m Warp Version${NC}"
    echo -e " ${ORANGE}[15].${NC}\033[0;36m Help${NC}"
    echo -e " ${ORANGE}[16].${NC}\033[0;36m Warp Menu Chinese Special Feature${NC}"
    echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit ${NC}"
    echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
}

# Fungsi utama
function main {
    while true; do
        display_menu
        read -p "Select From Options [ 1 - 16 or x ] : " menu
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
                echo "Activating Warp Mode Proxy..."
                bash <(curl -fsSL git.io/warp.sh) proxy
                ;;
            5)
                echo "Deactivating Warp Mode Proxy..."
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
                echo "Pilihan tidak valid."
                ;;
        esac
        echo -e "\n"
    done
}

# Jalankan fungsi utama
main
