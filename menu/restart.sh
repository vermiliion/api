#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip)
echo "Checking VPS"

clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Restart All Services"
echo -e " [\e[36m•2\e[0m] Restart OpenSSH"
echo -e " [\e[36m•3\e[0m] Restart Dropbear"
echo -e " [\e[36m•4\e[0m] Restart Stunnel4"
echo -e " [\e[36m•5\e[0m] Restart OpenVPN"
echo -e " [\e[36m•6\e[0m] Restart Squid"
echo -e " [\e[36m•7\e[0m] Restart Nginx"
echo -e " [\e[36m•8\e[0m] Restart Badvpn"
echo -e " [\e[36m•9\e[0m] Restart XRAY"
echo -e " [\e[36m10\e[0m] Restart WEBSOCKET"
echo -e " [\e[36m11\e[0m] Restart Trojan Go"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "Select menu : " Restart
echo -e ""
sleep 1
clear

function go_back() {
    read -n 1 -s -r -p "Press any key to back on system menu"
    restart_menu
}

function restart_menu() {
    clear
    # The menu content can be duplicated here or sourced from another function
    ./restart_script.sh  # Assuming this script is named restart_script.sh
}

case $Restart in
    1)
        clear
        echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
        echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e ""
        echo -e "[ \033[32mInfo\033[0m ] Restarting All Services..."
        sleep 1
        /etc/init.d/ssh restart
        /etc/init.d/dropbear restart
        /etc/init.d/stunnel4 restart
        /etc/init.d/openvpn restart
        /etc/init.d/fail2ban restart
        /etc/init.d/cron restart
        /etc/init.d/nginx restart
        /etc/init.d/squid restart
        echo -e "[ \033[32mok\033[0m ] All services restarted."
        go_back
        ;;
    2)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting SSH..."
        sleep 1
        /etc/init.d/ssh restart
        echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
        go_back
        ;;
    3)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Dropbear..."
        sleep 1
        /etc/init.d/dropbear restart
        echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
        go_back
        ;;
    4)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Stunnel4..."
        sleep 1
        /etc/init.d/stunnel4 restart
        echo -e "[ \033[32mInfo\033[0m ] Stunnel4 Service Restarted"
        go_back
        ;;
    5)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting OpenVPN..."
        sleep 1
        /etc/init.d/openvpn restart
        echo -e "[ \033[32mInfo\033[0m ] OpenVPN Service Restarted"
        go_back
        ;;
    6)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Squid..."
        sleep 1
        /etc/init.d/squid restart
        echo -e "[ \033[32mInfo\033[0m ] Squid Service Restarted"
        go_back
        ;;
    7)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Nginx..."
        sleep 1
        /etc/init.d/nginx restart
        echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
        go_back
        ;;
    8)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Badvpn..."
        sleep 1
        screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
        echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
        go_back
        ;;
    9)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting XRAY..."
        sleep 1
        systemctl restart xray
        echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
        go_back
        ;;
    10)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting WEBSOCKET..."
        sleep 1
        systemctl restart sshws.service
        systemctl restart ws-dropbear.service
        systemctl restart ws-stunnel.service
        echo -e "[ \033[32mInfo\033[0m ] WEBSOCKET Service Restarted"
        go_back
        ;;
    11)
        clear
        echo -e "[ \033[32mInfo\033[0m ] Restarting Trojan Go..."
        sleep 1
        systemctl restart trojan-go.service
        echo -e "[ \033[32mInfo\033[0m ] Trojan Go Service Restarted"
        go_back
        ;;
    0)
        menu  # Assuming you have a function named `menu` that handles the main menu
        exit
        ;;
    x)
        clear
        exit
        ;;
    *) 
        echo -e "Invalid selection, please try again."
        sleep 2
        restart_menu
        ;;
esac
