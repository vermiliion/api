#!/bin/bash
yellow="\033[0;33m"
ungu="\033[0;35m"
red="\033[91;1m"
xark="\033[0m"
blueCyan="\033[5;36m"
cyan="\033[96;1m"
purple="\033[95;1m"
green="\033[92;1m"
whiteBe="\033[5;37m"
greenBe="\033[5;32m"
yellowBe="\033[5;33m"
blueBe="\033[5;34m"

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

echo -e "\e[91;1m Mengupdate Script... \e[0m"
sleep 2


cd /usr/bin
loading $! wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
loading $! wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
loading $! wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
loading $! wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
loading $! wget -q -O /usr/bin/running "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
loading $! wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
loading $! wget -q -O /usr/bin/menu-trgo "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trgo.sh"
loading $! wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
loading $! wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
loading $! wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
loading $! wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
loading $! wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/renew.sh"
loading $! wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/vermiliion/api/main/ssh/hapus.sh"
loading $! wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/vermiliion/api/main/ssh/cek.sh"
loading $! wget -q -O /usr/bin/member "https://raw.githubusercontent.com/vermiliion/api/main/ssh/member.sh"
loading $! wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/vermiliion/api/main/ssh/delete.sh"
loading $! wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/vermiliion/api/main/ssh/autokill.sh"
loading $! wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/vermiliion/api/main/ssh/ceklim.sh"
loading $! wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
loading $! wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
loading $! wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
loading $! wget -q -O /usr/bin/menu-domain "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-domain.sh"
loading $! wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
loading $! wget -q -O /usr/bin/port-change "https://raw.githubusercontent.com/vermiliion/api/main/port/port-change.sh"
loading $! wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
loading $! wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
loading $! wget -q -O /usr/bin/menu-warp "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
loading $! wget -q -O /usr/bin/menu-nubz "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
loading $! wget -q -O /usr/bin/menu-nob "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
loading $! wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
loading $! wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
loading $! wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
loading $! wget -q -O /usr/bin/about "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
loading $! wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
loading $! wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
loading $! wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/vermiliion/api/main/menu/bw.sh"
loading $! wget -q -O /usr/bin/port-ssl "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ssl.sh"
loading $! wget -q -O /usr/bin/port-ovpn "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ovpn.sh"
loading $! wget -q -O /usr/bin/acs-set "https://raw.githubusercontent.com/vermiliion/api/main/acs-set.sh"
loading $! wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
loading $! wget -q -O /usr/bin/sshws "https://raw.githubusercontent.com/vermiliion/api/main/sshws/sshws.sh"
loading $! wget -q -O /usr/bin/status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
loading $! wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
loading $! wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/vermiliion/api/main/backup/backup.sh"
loading $! wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/vermiliion/api/main/backup/restore.sh"
loading $! wget -q -O /usr/bin/jam "https://raw.githubusercontent.com/vermiliion/api/main/jam.sh"
loading $! wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/vermiliion/api/main/user-lock.sh"
loading $! wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/vermiliion/api/main/user-unlock.sh"
loading $! wget -q -O /usr/bin/bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot2.sh"
loading $! wget -q -O /usr/bin/add-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot.sh"
loading $! wget -q -O /usr/bin/add-bot-bersama "https://raw.githubusercontent.com/vermiliion/api/main/bot/add-bot-bersama.sh"
loading $! wget -q -O /usr/bin/bot-bansos "https://raw.githubusercontent.com/vermiliion/api/main/bot/bot-bansos.sh"
loading $! wget -q -O /usr/bin/stop-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot.sh"
loading $! wget -q -O /usr/bin/stop-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/stop-bot2.sh"
loading $! wget -q -O /usr/bin/restart-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot.sh"
loading $! wget -q -O /usr/bin/restart-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/restart-bot2.sh"
loading $! wget -q -O /usr/bin/hapus-bot "https://raw.githubusercontent.com/vermiliion/api/main/bot/hapus-bot.sh"
loading $! wget -q -O /usr/bin/del-bot2 "https://raw.githubusercontent.com/vermiliion/api/main/bot/del-bot2.sh"
loading $! wget -q -O /usr/bin/update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
loading $! chmod +x /usr/bin/menu
loading $! chmod +x /usr/bin/menu-trial
loading $! chmod +x /usr/bin/menu-vmess
loading $! chmod +x /usr/bin/menu-vless
loading $! chmod +x /usr/bin/running
loading $! chmod +x /usr/bin/clearcache
loading $! chmod +x /usr/bin/menu-trgo
loading $! chmod +x /usr/bin/menu-trojan
loading $! chmod +x /usr/bin/menu-ssh
loading $! chmod +x /usr/bin/usernew
loading $! chmod +x /usr/bin/trial
loading $! chmod +x /usr/bin/renew
loading $! chmod +x /usr/bin/hapus
loading $! chmod +x /usr/bin/cek
loading $! chmod +x /usr/bin/member
loading $! chmod +x /usr/bin/delete
loading $! chmod +x /usr/bin/autokill
loading $! chmod +x /usr/bin/ceklim
loading $! chmod +x /usr/bin/tendang
loading $! chmod +x /usr/bin/menu-set
loading $! chmod +x /usr/bin/menu-domain
loading $! chmod +x /usr/bin/add-host
loading $! chmod +x /usr/bin/port-change
loading $! chmod +x /usr/bin/certv2ray
loading $! chmod +x /usr/bin/menu-webmin
loading $! chmod +x /usr/bin/menu-nob
loading $! chmod +x /usr/bin/menu-ss
loading $! chmod +x /usr/bin/speedtest
loading $! chmod +x /usr/bin/about
loading $! chmod +x /usr/bin/auto-reboot
loading $! chmod +x /usr/bin/restart
loading $! chmod +x /usr/bin/bw
loading $! chmod +x /usr/bin/port-ssl
loading $! chmod +x /usr/bin/port-ovpn
loading $! chmod +x /usr/bin/xp
loading $! chmod +x /usr/bin/acs-set
loading $! chmod +x /usr/bin/sshws
loading $! chmod +x /usr/bin/status
loading $! chmod +x /usr/bin/menu-backup
loading $! chmod +x /usr/bin/backup
loading $! chmod +x /usr/bin/restore
loading $! chmod +x /usr/bin/jam
loading $! chmod +x /usr/bin/lock
loading $! chmod +x /usr/bin/unlock
loading $! chmod +x /usr/bin/bot2
loading $! chmod +x /usr/bin/add-bot
loading $! chmod +x /usr/bin/add-bot-bersama
loading $! chmod +x /usr/bin/bot-bansos
loading $! chmod +x /usr/bin/stop-bot
loading $! chmod +x /usr/bin/stop-bot2
loading $! chmod +x /usr/bin/restart-bot
loading $! chmod +x /usr/bin/restart-bot2
loading $! chmod +x /usr/bin/hapus-bot
loading $! chmod +x /usr/bin/del-bot2
loading $! chmod +x /usr/bin/update
loading $! sed -i 's/\r$//' /usr/bin/menu-bot
loading $! sed -i 's/\r$//' /usr/bin/menu-warp
loading $! sed -i 's/\r$//' /usr/bin/menu-nubz
loading $! chmod +x /usr/bin/menu-bot
loading $! chmod +x /usr/bin/menu-warp
loading $! chmod +x /usr/bin/menu-nubz

echo

# Loading saat sleep
sleep 2 & loading $!

clear


sleep 0.6 & loading $!
clear
cd
rm -f update.sh
clear
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
