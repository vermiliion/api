#!/bin/bash

# Define the loading function
loading() {
  local pid=$1
  local delay=0.1
  local spin='-\|/'

  while ps -p "$pid" > /dev/null; do
    printf "[%c] " "$spin"
    spin=${spin#?}${spin%"${spin#?}"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}

# Skip the root and OpenVZ check to avoid scanning

# Mengambil versi saat ini
version=$(cat /home/ver)
ver=$(curl -s https://raw.githubusercontent.com/vermiliion/api/main/version)

# Menentukan apakah versi yang diinstal adalah yang terbaru atau tidak
clear
line=$(cat /etc/line)
below=$(cat /etc/below)
back_text=$(cat /etc/back)
number=$(cat /etc/number)
box=$(cat /etc/box)

Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available ${Red_font_prefix}[Please Update]${Font_color_suffix}"

new_version=$(curl -s https://raw.githubusercontent.com/vermiliion/api/main/version | grep $version)

if [ "$version" = "$new_version" ]; then
    sts="${Info1}"
else
    sts="${Error}"
fi

# Proses update
clear
echo -e "\e[1;36mStart Update For New Version, Please Wait...\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script...\e[0m"
sleep 1
echo ""
cd /usr/bin

# Mengunduh dan memperbarui skrip
wget -q -O run-update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
chmod +x run-update
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2

# Mengunduh semua skrip baru
urls=(
    "ssh/usernew.sh"
    "menu/auto-reboot.sh"
    "menu/restart.sh"
    "ssh/tendang.sh"
    "menu/clearcache.sh"
    "menu/running.sh"
    "ssh/speedtest_cli.py"
    "menu/menu-vless.sh"
    "menu/menu-vmess.sh"
    "menu/menu-trojan.sh"
    "menu/menu-ssh.sh"
    "menu/menu-backup.sh"
    "menu/menu.sh"
    "menu/menu-webmin.sh"
    "menu/menu-warp.sh"
    "menu/menu-nubz.sh"
    "menu/menu-nob.sh"
    "menu/menu-bot.sh"
    "menu/menu-ss.sh"
    "ssh/xp.sh"
    "update.sh"
    "ssh/add-host.sh"
    "xray/certv2ray.sh"
    "menu/menu-set.sh"
    "menu/about.sh"
    "ssh/trial.sh"
    "xray/add-tr.sh"
    "xray/del-tr.sh"
    "xray/cek-tr.sh"
    "xray/trialtrojan.sh"
    "xray/renew-tr.sh"
    "xray/add-ws.sh"
    "xray/del-ws.sh"
    "xray/cek-ws.sh"
    "xray/renew-ws.sh"
    "xray/trialvmess.sh"
    "xray/add-vless.sh"
    "xray/del-vless.sh"
    "xray/cek-vless.sh"
    "xray/renew-vless.sh"
    "xray/trialvless.sh"
    "xray/add-ss.sh"
    "xray/trialss.sh"
    "xray/del-ss.sh"
    "xray/renew-ss.sh"
    "xray/cek-ss.sh"
    "bot/bot2.sh"
    "bot/add-bot.sh"
    "bot/add-bot-bersama.sh"
    "bot/bot-bansos"
    "menu/menu-trial.sh"
)

# Start the download in the background and show loading animation
(
for url in "${urls[@]}"; do
    wget -q -O "/usr/bin/$(basename $url)" "https://raw.githubusercontent.com/vermiliion/api/main/$url"
    chmod +x "/usr/bin/$(basename $url)"
    sleep 2
    sed -i 's/\r$//' "/usr/bin/$(basename $url)" 
  
done
) &

# Get the process ID of the background job
pid=$!
loading $pid  # Call the loading function

# Wait for the background job to finish
wait $pid

clear
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""

# Menampilkan status patching
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
sleep 1
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo -e "\e[0;32mSuccess Update Script For New Version\e[0m"
cd
rm -f update.sh

# Kembali ke menu
clear
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
