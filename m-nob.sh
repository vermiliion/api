#!/bin/bash

# Colors
runn='\e[38;5;14m' 
acc='\e[38;5;146m'
LO='\e[38;5;162m' # PURPLE SANGAR
UK='\e[38;5;99m'  # UNGU KOLOT
BK='\e[38;5;196m' # BEREM KOLOT 
R1='\e[38;5;155m' # HEJO SEMU BODAS
R2='\e[38;5;49m'  # HEJO LIME / APEL
BC='\e[38;5;195m' # BODAS CERAH PISAN
HU='\e[38;5;115m' # HEJO SEMU ABU
UB='\e[38;5;147m' # UNGU KABODASAN
KT='\e[38;5;187m' # KONENG TARIGU
Suffix='\e[0m'
Xark="\e[0m"

# . Liner 
function Liner() {
  echo -e "${w} ◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇ ${R2} "
}

# . Banner
function Banner() {
echo -e "${R1}        CREATE TITLE ACCOUNT          \e[0m"
}



# Telegram settings
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"

# Function to install NoobzVpn-Server
install_noobzvpn() {
    wget https://raw.githubusercontent.com/Lite-VPN/v3/main/files/noobzvpns.zip
    unzip noobzvpns.zip
    cd noobzvpns
    bash install.sh
    rm noobzvpns.zip
    rm -rf noobzvpns.zip
    systemctl restart noobzvpns
}

# Function to add a new NoobVPN user
add_noobvpn_user() {
clear
Liner
Banner
Liner
    read -p " Username : " username
    echo ""
    read -p " Password : " password
    echo ""
    read -p " Expiry   : " days
    
    noobzvpns --add-user "$username" "$password"
    noobzvpns --expired-user "$username" "$days"
    echo "#nob# ${username} ${Password} ${days}" >>/etc/noobzvpns/.noobzvpns.db
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    clear
    echo ""


mkdir -p /detail/nob
cat > /detail/nob/$username.txt <<-END
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
           DETAIL ACCOUNT
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
Username         : $username
Password         : $password
Host             : $domain
Base Config      : Bs64
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
Aktif Selama     : $days Hari
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
END



Liner
    echo -e "${R1}         NOOBZVPN ACCOUNT       \e[0m"
Liner
    echo -e "Username         : $username"
    echo -e "Password         : $password"
    echo -e "Host             : $domain"
Liner
    echo -e "Aktif Selama     : $days Hari"
Liner    
}

# Function to block a user
block_user() {
    read -p "Enter username to block: " username
    noobzvpns --block-user "$username"
}

# Function to unblock a user
unblock_user() {
    read -p "Enter username to unblock: " username
    noobzvpns --unblock-user "$username"
}

# Function to set expiration for a user
set_expiration() {
    read -p "Enter username: " username
    read -p "Enter expiration days (0 for unlimited): " days
    noobzvpns --expired-user "$username" "$days"
}

# Function to renew expiration for a user
renew_expiration() {
    read -p "Enter username to renew expiration: " username
    noobzvpns --renew-user "$username"
}

# Function to change password for a user
change_password() {
    read -p "Enter username: " username
    read -p "Enter new password: " new_password
    noobzvpns--password-user "$username" "$new_password"
}

# Function to rename a user
rename_user() {
    read -p "Enter current username: " old_username
    read -p "Enter new username: " new_username
    noobzvpns --rename-user "$old_username" "$new_username"
}

# Function to remove a user
remove_user() {
    read -p "Enter username to remove: " username
    noobzvpns --remove-user "$username"
}

# Function to remove all users
remove_all_users() {
    read -p "Are you sure you want to remove all users? (yes/no): " confirm
    if [ "$confirm" == "yes" ]; then
        noobzvpns --remove-all-user
    else
        echo "Operation cancelled."
    fi
}

# Function to get info for a user
info_user() {
    read -p "Enter username: " username
    noobzvpns --info-user "$username"
}

# Function to get info for all users
info_all_users() {
    noobzvpns --info-all-user
}

clear

# Permission checking
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear

ipsaya=$(wget -qO- ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Lite-VPN/izin/main/ip"

checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !\e[0m"
    echo -e "   \033[0;33mYour VPS\e[0m $ipsaya \033[0;33mHas been Banned\e[0m"
    echo -e "     \033[0;33mBuy access permissions for scripts\e[0m"
    echo -e "             \033[0;33mContact Admin :\e[0m"
    echo -e "      \033[0;36mTelegram\e[0m t.me/Lite_Vermillion"
    echo -e "      ${GREEN}WhatsApp\e[0m wa.me/6283867809137"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}

checking_sc

echo -e "\e[32mloading...\e[0m"
clear

#Domain
domain=$(cat /etc/xray/domain)

Liner
echo -e "${R2}            NoobzVpnS           \e[0m"
Liner
Liner
echo -e "  \e[97;1m[01]. Add User\e[0m"
echo -e "  \e[97;1m[02]. Block User\e[0m"
echo -e "  \e[97;1m[03]. Unblock User\e[0m"
echo -e "  \e[97;1m[04]. Set Expiration\e[0m"
echo -e "  \e[97;1m[05]. Renew Expiration\e[0m"
echo -e "  \e[97;1m[06]. Change Password\e[0m"
echo -e "  \e[97;1m[07]. Rename User\e[0m"
echo -e "  \e[97;1m[08]. Remove User\e[0m"
echo -e "  \e[97;1m[09]. Remove All Users\e[0m"
echo -e "  \e[97;1m[10]. Info User\e[0m"
echo -e "  \e[97;1m[11]. Info All Users\e[0m"
echo -e "  \e[97;1m[12]. Detail Account User\e[0m"
echo -e "  \e[91;1m[13]. Exit\e[0m"
Liner
echo ""

read -p " Just Input Number: " menu
echo -e ""

case $menu in
1) add_noobvpn_user ;;
2) block_user ;;
3) unblock_user ;;
4) set_expiration ;;
5) renew_expiration ;;
6) change_password ;;
7) rename_user ;;
8) remove_user ;;
9) remove_all_users ;;
10) info_user ;;
11) info_all_users ;;
12) user-nob ;;
13) exit ;;
*) echo "Invalid choice. Please enter a number between 1 and 13." ;;
esac
