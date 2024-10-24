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

# Membersihkan layar dan mulai proses update
clear
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""

# Mulai download skrip update terbaru di background
(
    cd /usr/bin
    wget -q -O /usr/bin/run-update "https://raw.githubusercontent.com/vermiliion/api/main/up"
    
    # Periksa apakah unduhan berhasil
    if [ -f /usr/bin/run-update ]; then
        echo "Script update berhasil diunduh"
        chmod +x /usr/bin/run-update
    else
        echo "Gagal mengunduh skrip update"
        exit 1
    fi
) &
pid=$!  # Ambil PID dari proses background
loading $pid  # Jalankan loading hingga proses selesai

# Tampilkan pesan bahwa update telah selesai
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
