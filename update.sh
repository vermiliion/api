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

# Download skrip update terbaru
cd /usr/bin
wget -q -O /usr/bin/run-update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
chmod +x /usr/bin/run-update
clear

echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 2
loading() {
    local pid=$1
    local delay=0.5  # Delay for loading animation

    # Show loading animation while the process is running
    while ps -p $pid > /dev/null; do
        echo -n "."
        sleep $delay
    done
    echo ""  # New line after the loading animation
}

# Check if there are any files in /usr/bin
if ls /usr/bin/* &> /dev/null; then
    echo "Script update berhasil diunduh"
    chmod +x /usr/bin/*
else
    echo "Gagal mengunduh skrip update"
    exit 1
fi &

pid=$!  
loading $pid 

clear
cd /usr/bin
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trgo.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/renew.sh"
wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/vermiliion/api/main/ssh/hapus.sh"
wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/vermiliion/api/main/ssh/cek.sh"
wget -q -O /usr/bin/member "https://raw.githubusercontent.com/vermiliion/api/main/ssh/member.sh"
wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/vermiliion/api/main/ssh/delete.sh"
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/vermiliion/api/main/ssh/autokill.sh"
wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/vermiliion/api/main/ssh/ceklim.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
wget -q -O /usr/bin/menu-domain "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-domain.sh"
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
wget -q -O /usr/bin/port-change "https://raw.githubusercontent.com/vermiliion/api/main/port/port-change.sh"
wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
wget -q -O /usr/bin/menu-warp "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
wget -q -O /usr/bin/menu-nubz "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
wget -q -O /usr/bin/menu-nob "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/vermiliion/api/main/menu/bw.sh"
wget -q -O /usr/bin/port-ssl "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ssl.sh"
wget -q -O /usr/bin/port-ovpn "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ovpn.sh"
wget -q -O /usr/bin/acs-set "https://raw.githubusercontent.com/vermiliion/api/main/acs-set.sh"
wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
wget -q -O /usr/bin/sshws "https://raw.githubusercontent.com/vermiliion/api/main/sshws/sshws.sh"
wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/vermiliion/api/main/backup/backup.sh"
wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/vermiliion/api/main/backup/restore.sh"
wget -q -O /usr/bin/jam "https://raw.githubusercontent.com/vermiliion/api/main/jam.sh"
wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/vermiliion/api/main/user-lock.sh"
wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/vermiliion/api/main/user-unlock.sh"
wget -q -O /usr/bin/bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot2.sh"
wget -q -O /usr/bin/add-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot.sh"
wget -q -O /usr/bin/add-bot-bersama "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot-bersama.sh"
wget -q -O /usr/bin/bot-bansos "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot-bansos.sh"
wget -q -O /usr/bin/stop-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot.sh"
wget -q -O /usr/bin/stop-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot2.sh"
wget -q -O /usr/bin/restart-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot.sh"
wget -q -O /usr/bin/restart-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot2.sh"
wget -q -O /usr/bin/hapus-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/hapus-bot.sh"
wget -q -O /usr/bin/del-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/del-bot2.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
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
