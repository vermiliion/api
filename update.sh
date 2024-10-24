#!/bin/bash

# Memastikan script dijalankan sebagai root
if [ "${EUID}" -ne 0 ]; then
    echo "You need to run this script as root"
    exit 1
fi

# Memeriksa apakah sistem berjalan di OpenVZ
if [ "$(systemd-detect-virt)" == "openvz" ]; then
    echo "OpenVZ is not supported"
    exit 1
fi

echo ""

# Mendapatkan versi saat ini dari file lokal
version=$(cat /home/ver)

# Mendapatkan versi terbaru dari server
ver=$(curl -s https://raw.githubusercontent.com/vermiliion/api/main/version)

# Membersihkan layar
clear

# Membaca file konfigurasi lain jika diperlukan
line=$(cat /etc/line 2>/dev/null)
below=$(cat /etc/below 2>/dev/null)
back_text=$(cat /etc/back 2>/dev/null)
number=$(cat /etc/number 2>/dev/null)
box=$(cat /etc/box 2>/dev/null)

# Definisi warna
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Font_color_suffix="\033[0m"

# Informasi versi
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available ${Red_font_prefix}[Please Update]${Font_color_suffix}"

# Membandingkan versi lokal dengan versi terbaru
if [ "$version" = "$ver" ]; then
    sts="${Info1}"
else
    sts="${Error}"
fi

# Fungsi loading animasi

# Membersihkan layar dan mulai proses update
clear
echo -e "\e[1;36mMengupdate Script.......\e[m"
sleep 2

loading() {
    local pid=$1
    local delay=0.1
    local spin='-\|/'

    # Show loading animation while the process is running
    while ps -p "$pid" > /dev/null; do
        printf "[%c] " "$spin"
        spin=${spin#?}${spin%"${spin#?}"}
        sleep $delay
        printf "\b\b\b\b\b\b"  # Move cursor back to overwrite
    done

    printf "    \b\b\b\b"  # Clear the spinner after completion
}

clear
cd /usr/bin

# Function to download a file with loading animation
download_with_loading() {
    local output=$1
    local url=$2

    wget -q -O "$output" "$url" &  # Start the download in the background
    local pid=$!  # Get PID of the wget process
    loading $pid  # Start loading animation while downloading
}

# Download files with loading animation
download_with_loading "menu" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
download_with_loading "menu-trial" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
download_with_loading "menu-vmess" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
download_with_loading "menu-vless" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
download_with_loading "running" "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
download_with_loading "clearcache" "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
download_with_loading "menu-trgo" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trgo.sh"
download_with_loading "menu-trojan" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
download_with_loading "menu-ssh" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
download_with_loading "usernew" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
download_with_loading "trial" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
download_with_loading "renew" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/renew.sh"
download_with_loading "hapus" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/hapus.sh"
download_with_loading "cek" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/cek.sh"
download_with_loading "member" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/member.sh"
download_with_loading "delete" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/delete.sh"
download_with_loading "autokill" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/autokill.sh"
download_with_loading "ceklim" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/ceklim.sh"
download_with_loading "tendang" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
download_with_loading "xp" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
download_with_loading "menu-set" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
download_with_loading "menu-domain" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-domain.sh"
download_with_loading "add-host" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
download_with_loading "port-change" "https://raw.githubusercontent.com/vermiliion/api/main/port/port-change.sh"
download_with_loading "certv2ray" "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
download_with_loading "menu-webmin" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
download_with_loading "menu-warp" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
download_with_loading "menu-nubz" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
download_with_loading "menu-nob" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
download_with_loading "menu-bot" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
download_with_loading "menu-ss" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
download_with_loading "speedtest" "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
download_with_loading "about" "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
download_with_loading "auto-reboot" "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
download_with_loading "restart" "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
download_with_loading "bw" "https://raw.githubusercontent.com/vermiliion/api/main/menu/bw.sh"
download_with_loading "port-ssl" "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ssl.sh"
download_with_loading "port-ovpn" "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ovpn.sh"
download_with_loading "acs-set" "https://raw.githubusercontent.com/vermiliion/api/main/acs-set.sh"
download_with_loading "status" "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
download_with_loading "sshws" "https://raw.githubusercontent.com/vermiliion/api/main/sshws/sshws.sh"
download_with_loading "menu-backup" "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
download_with_loading "backup" "https://raw.githubusercontent.com/vermiliion/api/main/backup/backup.sh"
download_with_loading "restore" "https://raw.githubusercontent.com/vermiliion/api/main/backup/restore.sh"
download_with_loading "jam" "https://raw.githubusercontent.com/vermiliion/api/main/jam.sh"
download_with_loading "lock" "https://raw.githubusercontent.com/vermiliion/api/main/user-lock.sh"
download_with_loading "unlock" "https://raw.githubusercontent.com/vermiliion/api/main/user-unlock.sh"
download_with_loading "bot2" "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot2.sh"
download_with_loading "add-bot" "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot.sh"
download_with_loading "add-bot-bersama" "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot-bersama.sh"
download_with_loading "bot-bansos" "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot-bansos.sh"
download_with_loading "stop-bot" "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot.sh"
download_with_loading "stop-bot2" "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot2.sh"
download_with_loading "restart-bot" "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot.sh"
download_with_loading "restart-bot2" "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot2.sh"
download_with_loading "hapus-bot" "https://raw.githubusercontent.com/vermiliion/api/main/bot/hapus-bot.sh"
download_with_loading "del-bot2" "https://raw.githubusercontent.com/vermiliion/api/main/bot/del-bot2.sh"
download_with_loading "update" "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
chmod +x /usr/bin/menu
chmod +x /usr/bin/menu-trial
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/running
chmod +x /usr/bin/clearcache
chmod +x /usr/bin/menu-trgo
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/usernew
chmod +x /usr/bin/trial
chmod +x /usr/bin/renew
chmod +x /usr/bin/hapus
chmod +x /usr/bin/cek
chmod +x /usr/bin/member
chmod +x /usr/bin/delete
chmod +x /usr/bin/autokill
chmod +x /usr/bin/ceklim
chmod +x /usr/bin/tendang
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/menu-domain
chmod +x /usr/bin/add-host
chmod +x /usr/bin/port-change
chmod +x /usr/bin/certv2ray
chmod +x /usr/bin/menu-webmin
chmod +x /usr/bin/menu-nob
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/about
chmod +x /usr/bin/auto-reboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/bw
chmod +x /usr/bin/port-ssl
chmod +x /usr/bin/port-ovpn
chmod +x /usr/bin/xp
chmod +x /usr/bin/acs-set
chmod +x /usr/bin/sshws
chmod +x /usr/bin/status
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/backup
chmod +x /usr/bin/restore
chmod +x /usr/bin/jam
chmod +x /usr/bin/lock
chmod +x /usr/bin/unlock
chmod +x /usr/bin/bot2
chmod +x /usr/bin/add-bot
chmod +x /usr/bin/add-bot-bersama
chmod +x /usr/bin/bot-bansos
chmod +x /usr/bin/stop-bot
chmod +x /usr/bin/stop-bot2
chmod +x /usr/bin/restart-bot
chmod +x /usr/bin/restart-bot2
chmod +x /usr/bin/hapus-bot
chmod +x /usr/bin/del-bot2
chmod +x /usr/bin/update
sed -i 's/\r$//' /usr/bin/menu-bot
sed -i 's/\r$//' /usr/bin/menu-warp
sed -i 's/\r$//' /usr/bin/menu-nubz
chmod +x /usr/bin/menu-bot
chmod +x /usr/bin/menu-warp
chmod +x /usr/bin/menu-nubz
clear
echo -e "\e[0;32mDownloaded successfully!\e[0m"
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSuccess Update Script For New Version\e[0m"
cd
rm -f update.sh
clear
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
