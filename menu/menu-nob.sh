#!/bin/bash

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

BIYellow='\e[1;93m'
NC='\e[0m'  # No Color
runn='\e[38;5;14m' 
acc='\e[38;5;146m'
R1='\e[38;5;155m' 
R2='\e[38;5;49m'  
Suffix='\e[0m'

# Liner (line separator)
function Liner() {
  echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
}

# Banner (header title)
function Banner() {
  echo -e "${BIYellow}  \e[44;97;1m                NOOBZVPNs MENU                  \033[0m ${BIYellow} ${NC}"
  echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
}

# Install NoobzVPN
function ins_noobz() {
  clear
  echo -e "${runn} Installing NoobzVPN...${Suffix}"
  wget https://raw.githubusercontent.com/vermiliion/api/main/noobzvpns.zip
  unzip noobzvpns.zip
  cd
  ls
  rm- rf noobzvpns.zip
  cd noobzvpns
  chmod +x install.sh
  ./install.sh
  systemctl start noobzvpns
  systemctl restart noobzvpns
  echo -e "${acc} NoobzVPN successfully installed! ${Suffix}"
  read -n 1 -s -r -p "Press any key to menu"
  menu-nob
}

# Uninstall NoobzVPN
function uninstall_noobz() {
  clear
  echo -e "${runn} Uninstalling NoobzVPN...${Suffix}"
  systemctl stop noobzvpns
  systemctl disable noobzvpns
  rm -rf /etc/noobzvpns
  rm -rf /usr/local/bin/noobzvpns
  rm -f /etc/systemd/system/noobzvpns.service
  echo -e "${acc} NoobzVPN successfully uninstalled! ${Suffix}"
  read -n 1 -s -r -p "Press any key to menu"
  menu-nob
}

# Restart NoobzVPN
function restart_noobz() {
  clear
  echo -e "${runn} Restarting NoobzVPN...${Suffix}"
  systemctl restart noobzvpns
  echo -e "${acc} NoobzVPN successfully restarted! ${Suffix}"
  read -n 1 -s -r -p "Press any key to menu"
  menu-nob
}

# Add NoobzVPN user
function add_noobvpn_user() {
  clear
  Liner
  Banner
  Liner
  read -p " Username: " username
  read -p " Password: " password
  read -p " Expiry (days): " days
  
  noobzvpns --add-user "$username" "$password"
  noobzvpns --expired-user "$username" "$days"
  echo "#nob# ${username} ${password} ${days}" >>/etc/noobzvpns/.noobzvpns.db

  mkdir -p /detail/nob
  cat > /detail/nob/$username.txt <<-END
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
           DETAIL ACCOUNT
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
Username         : $username
Password         : $password
Host             : $(cat /etc/xray/domain)
Base Config      : Bs64
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
Aktif Selama     : $days Hari
◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇
END

  Liner
  echo -e "${R1} NoobzVPN Account Details \e[0m"
  Liner
  echo -e "Username         : $username"
  echo -e "Password         : $password"
  echo -e "Host             : $(cat /etc/xray/domain)"
  echo -e "Aktif Selama     : $days Hari"
  Liner
  read -n 1 -s -r -p "Press any key to menu"
  menu-nob
}

# Other user-related functions
function block_user() {
    read -p "Enter username to block: " username
    noobzvpns --block-user "$username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function unblock_user() {
    read -p "Enter username to unblock: " username
    noobzvpns --unblock-user "$username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function set_expiration() {
    read -p "Enter username: " username
    read -p "Enter expiration days (0 for unlimited): " days
    noobzvpns --expired-user "$username" "$days"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function renew_expiration() {
    read -p "Enter username to renew expiration: " username
    noobzvpns --renew-user "$username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function change_password() {
    read -p "Enter username: " username
    read -p "Enter new password: " new_password
    noobzvpns --password-user "$username" "$new_password"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function rename_user() {
    read -p "Enter current username: " old_username
    read -p "Enter new username: " new_username
    noobzvpns --rename-user "$old_username" "$new_username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function remove_user() {
    read -p "Enter username to remove: " username
    noobzvpns --remove-user "$username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function remove_all_users() {
    read -p "Are you sure you want to remove all users? (yes/no): " confirm
    if [ "$confirm" == "yes" ]; then
        noobzvpns --remove-all-user
    else
        echo "Operation cancelled."
    fi
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function info_user() {
    read -p "Enter username: " username
    noobzvpns --info-user "$username"
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

function info_all_users() {
    noobzvpns --info-all-user
    read -n 1 -s -r -p "Press any key to menu"
    menu-nob
}

# Main menu
clear
Liner
Banner
Liner
echo -e "  [01]. Install NoobzVPN"
echo -e "  [02]. Uninstall NoobzVPN"
echo -e "  [03]. Restart NoobzVPN"
echo -e "  [04]. Add User"
echo -e "  [05]. Block User"
echo -e "  [06]. Unblock User"
echo -e "  [07]. Set Expiration"
echo -e "  [08]. Renew Expiration"
echo -e "  [09]. Change Password"
echo -e "  [10]. Rename User"
echo -e "  [11]. Remove User"
echo -e "  [12]. Remove All Users"
echo -e "  [13]. Info User"
echo -e "  [14]. Info All Users"
echo -e "  [15]. Exit"
Liner

read -p " Please Select Menu: " menu
echo -e ""

case $menu in
1) ins_noobz ;;
2) uninstall_noobz ;;
3) restart_noobz ;;
4) add_noobvpn_user ;;
5) block_user ;;
6) unblock_user ;;
7) set_expiration ;;
8) renew_expiration ;;
9) change_password ;;
10) rename_user ;;
11) remove_user ;;
12) remove_all_users ;;
13) info_user ;;
14) info_all_users ;;
15) menu ;;
*) echo "Invalid choice. Please enter a number between 1 and 15." ;;
esac
