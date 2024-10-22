#!/bin/bash
# Mendapatkan tanggal dari server Google
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Fungsi untuk menampilkan teks merah
red() { 
    echo -e "\\033[32;1m${*}\\033[0m"; 
}

clear

# Fungsi progress bar
fun_bar() {
    CMD="$1"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        eval "$CMD" >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        if [[ -e $HOME/fim ]]; then
            rm $HOME/fim
            break
        fi
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

# Fungsi untuk mendownload semua file yang diperlukan
res1() {
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
        fun_bar "wget -q -O /usr/bin/$(basename $url) https://raw.githubusercontent.com/vermiliion/api/main/$url"
        chmod +x "/usr/bin/$(basename $url)"
    done
}

# Menjalankan netfilter-persistent
netfilter-persistent

# Membersihkan tampilan dan menampilkan informasi update
clear
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " \033[1;97;41m             MENGUPDATE SCRIPT           \033[0m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar 'res1'
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""

# Menunggu input dari pengguna untuk kembali ke menu
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
