#!/bin/bash

# Skip the root and OpenVZ check to avoid scanning

# Function to fetch the current version and latest version
fetch_versions() {
    version=$(cat /home/ver)
    ver=$(curl -s https://raw.githubusercontent.com/vermiliion/api/main/version)
}

# Function to determine if the installed version is the latest
check_version() {
    if [[ "$version" == "$ver" ]]; then
        sts="${Green_font_prefix}($version)${Font_color_suffix}"
    else
        sts="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available ${Red_font_prefix}[Please Update]${Font_color_suffix}"
    fi
}

# Function to display loading animation
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

# Function to download and update scripts
update_scripts() {
    echo -e "\e[0;32mPlease Wait...!\e[0m"
    sleep 2

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
        "menu/menu-trial.sh"
    )

    for url in "${urls[@]}"; do
        if ! wget -q -O "/usr/bin/$(basename "$url")" "https://raw.githubusercontent.com/vermiliion/api/main/$url"; then
            echo -e "${Red_font_prefix}Failed to download $url${Font_color_suffix}"
            return 1
        fi
        chmod +x "/usr/bin/$(basename "$url")"
    done
    return 0
}

# Start of the script
clear
fetch_versions
check_version

Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Font_color_suffix="\033[0m"
loading_pid=$!

# Change to the /usr/bin directory to download scripts
cd /usr/bin || { echo "Failed to change directory to /usr/bin"; exit 1; }
if ! wget -q -O run-update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"; then
    echo -e "${Red_font_prefix}Failed to download update script${Font_color_suffix}"
    exit 1
fi
chmod +x run-update

sleep 3 & loading $!
clear

if update_scripts; then
    echo -e "\e[0;32mSuccessfully updated scripts to the new version\e[0m"
else
    echo -e "\e[0;31mScript update failed. Please check the errors above.\e[0m"
fi

cd || { echo "Failed to change directory back"; exit 1; }
rm -f update.sh

# Return to the menu
echo ""
read -n 1 -s -r -p "Press any key to return to the menu"
menu
