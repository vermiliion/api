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
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
chmod +x run-update
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
wget -O menu-trial "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/vermiliion/api/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/vermiliion/api/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/vermiliion/api/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/vermiliion/api/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/vermiliion/api/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/vermiliion/api/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
wget -O xp "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
wget -O menu-set "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/vermiliion/api/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
wget -O menu-warp "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
wget -O menu-nubz "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
wget -O menu-nob "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
wget -O menu-bot "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
wget -O menu-ss "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
wget -O speedtest "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/vermiliion/api/main/menu/bw.sh"
wget -O port-ssl "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/vermiliion/api/main/port/port-ovpn.sh"
wget -O acs-set "https://raw.githubusercontent.com/vermiliion/api/main/acs-set.sh"
wget -O status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
wget -O sshws "https://raw.githubusercontent.com/vermiliion/api/main/sshws/sshws.sh"
wget -O status "https://raw.githubusercontent.com/vermiliion/api/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/vermiliion/api/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/vermiliion/api/main/backup/restore.sh"
wget -O jam "https://raw.githubusercontent.com/vermiliion/api/main/jam.sh"
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
chmod +x menu
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x menu-nob
chmod +x menu-ss
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x jam
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
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/vermiliion/api/main/version )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
rm -f update.sh
clear
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
