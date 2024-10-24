#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/vermiliion/api/main/version )
clear
line=$(cat /etc/line)
below=$(cat /etc/below)
back_text=$(cat /etc/back)
number=$(cat /etc/number)
box=$(cat /etc/box)
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/vermiliion/api/main/version | grep $version )
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
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

clear
echo -e "\e[1;36mMemulai Update Script....\e[m"
sleep 2
clear
echo -e "\e[0;32mMencari Versi Terbaru Script..\e[0m"
sleep 3
echo ""
cd /usr/bin
wget -q -O /usr/bin/run-update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
chmod +x run-update
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "\e[0;32mMemulai Mendownload Versi terbaru......!\e[0m"
sleep 2
cd /usr/bin
cd /usr/bin
sleep 2 & loading $! & wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/running "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trgo.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/renew.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/vermiliion/api/main/ssh/hapus.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/vermiliion/api/main/ssh/cek.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/member "https://raw.githubusercontent.com/vermiliion/api/main/ssh/member.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/vermiliion/api/main/ssh/delete.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/vermiliion/api/main/ssh/autokill.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/vermiliion/api/main/ssh/ceklim.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-domain "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-domain.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/port-change "https://raw.githubusercontent.com/vermiliion/api/main/port/port-change.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-warp "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-nubz "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-nob "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
sleep 2 & loading $! & wget -q -O /usr/bin/about "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/vermiliion/api/main/menu/bw.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/port-ssl "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ssl.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/port-ovpn "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ovpn.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/acs-set "https://raw.githubusercontent.com/vermiliion/api/main/acs-set.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/sshws "https://raw.githubusercontent.com/vermiliion/api/main/sshws/sshws.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/vermiliion/api/main/backup/backup.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/vermiliion/api/main/backup/restore.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/jam "https://raw.githubusercontent.com/vermiliion/api/main/jam.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/vermiliion/api/main/user-lock.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/vermiliion/api/main/user-unlock.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-bot-bersama "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot-bersama.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/bot-bansos "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot-bansos.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/stop-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/stop-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/hapus-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/hapus-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/del-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/del-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
sleep 2 & loading $! & chmod +x /usr/bin/menu
sleep 2 & loading $! & chmod +x /usr/bin/menu-trial
sleep 2 & loading $! & chmod +x /usr/bin/menu-vmess
sleep 2 & loading $! & chmod +x /usr/bin/menu-vless
sleep 2 & loading $! & chmod +x /usr/bin/running
sleep 2 & loading $! & chmod +x /usr/bin/clearcache
sleep 2 & loading $! & chmod +x /usr/bin/menu-trgo
sleep 2 & loading $! & chmod +x /usr/bin/menu-trojan
sleep 2 & loading $! & chmod +x /usr/bin/menu-ssh
sleep 2 & loading $! & chmod +x /usr/bin/usernew
sleep 2 & loading $! & chmod +x /usr/bin/trial
sleep 2 & loading $! & chmod +x /usr/bin/renew
sleep 2 & loading $! & chmod +x /usr/bin/hapus
sleep 2 & loading $! & chmod +x /usr/bin/cek
sleep 2 & loading $! & chmod +x /usr/bin/member
sleep 2 & loading $! & chmod +x /usr/bin/delete
sleep 2 & loading $! & chmod +x /usr/bin/autokill
sleep 2 & loading $! & chmod +x /usr/bin/ceklim
sleep 2 & loading $! & chmod +x /usr/bin/tendang
sleep 2 & loading $! & chmod +x /usr/bin/menu-set
sleep 2 & loading $! & chmod +x /usr/bin/menu-domain
sleep 2 & loading $! & chmod +x /usr/bin/add-host
sleep 2 & loading $! & chmod +x /usr/bin/port-change
sleep 2 & loading $! & chmod +x /usr/bin/certv2ray
sleep 2 & loading $! & chmod +x /usr/bin/menu-webmin
sleep 2 & loading $! & chmod +x /usr/bin/menu-nob
sleep 2 & loading $! & chmod +x /usr/bin/menu-ss
sleep 2 & loading $! & chmod +x /usr/bin/speedtest
sleep 2 & loading $! & chmod +x /usr/bin/about
sleep 2 & loading $! & chmod +x /usr/bin/auto-reboot
sleep 2 & loading $! & chmod +x /usr/bin/restart
sleep 2 & loading $! & chmod +x /usr/bin/bw
sleep 2 & loading $! & chmod +x /usr/bin/port-ssl
sleep 2 & loading $! & chmod +x /usr/bin/port-ovpn
sleep 2 & loading $! & chmod +x /usr/bin/xp
sleep 2 & loading $! & chmod +x /usr/bin/acs-set
sleep 2 & loading $! & chmod +x /usr/bin/sshws
sleep 2 & loading $! & chmod +x /usr/bin/status
sleep 2 & loading $! & chmod +x /usr/bin/menu-backup
sleep 2 & loading $! & chmod +x /usr/bin/backup
sleep 2 & loading $! & chmod +x /usr/bin/restore
sleep 2 & loading $! & chmod +x /usr/bin/jam
sleep 2 & loading $! & chmod +x /usr/bin/lock
sleep 2 & loading $! & chmod +x /usr/bin/unlock
sleep 2 & loading $! & chmod +x /usr/bin/bot2
sleep 2 & loading $! & chmod +x /usr/bin/add-bot
sleep 2 & loading $! & chmod +x /usr/bin/add-bot-bersama
sleep 2 & loading $! & chmod +x /usr/bin/bot-bansos
sleep 2 & loading $! & chmod +x /usr/bin/stop-bot
sleep 2 & loading $! & chmod +x /usr/bin/stop-bot2
sleep 2 & loading $! & chmod +x /usr/bin/restart-bot
sleep 2 & loading $! & chmod +x /usr/bin/restart-bot2
sleep 2 & loading $! & chmod +x /usr/bin/hapus-bot
sleep 2 & loading $! & chmod +x /usr/bin/del-bot2
sleep 2 & loading $! & chmod +x /usr/bin/update
sleep 2 & loading $! & sed -i 's/\r$//' /usr/bin/menu-bot
sleep 2 & loading $! & sed -i 's/\r$//' /usr/bin/menu-warp
sleep 2 & loading $! & sed -i 's/\r$//' /usr/bin/menu-nubz
sleep 2 & loading $! & chmod +x /usr/bin/menu-bot
sleep 2 & loading $! & chmod +x /usr/bin/menu-warp
sleep 2 & loading $! & chmod +x /usr/bin/menu-nubz
clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/vermiliion/api/main/version )
sleep 3
echo -e "\e[0;32mMenerapkan Pembaruan, Please Wait...\e[0m"
echo ""
sleep 3
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 3
echo ""
echo -e "\e[0;32mBerhasil Mengupdate Script......\e[0m"
cd
rm -f update.sh
clear
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
