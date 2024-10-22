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
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/vermiliion/api/main/menu/auto-reboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/vermiliion/api/main/menu/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/vermiliion/api/main/ssh/tendang.sh"
wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/vermiliion/api/main/menu/clearcache.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/vermiliion/api/main/menu/running.sh"
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/vermiliion/api/main/ssh/speedtest_cli.py"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu.sh"
wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-webmin.sh"
wget -q -O /usr/bin/menu-warp "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-warp.sh"
wget -q -O /usr/bin/menu-nubz "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nubz.sh"
wget -q -O /usr/bin/menu-nob "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-nob.sh"
wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-bot.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-ss.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/vermiliion/api/main/ssh/xp.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/vermiliion/api/main/update.sh"
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/vermiliion/api/main/ssh/add-host.sh"
wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/vermiliion/api/main/xray/certv2ray.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-set.sh"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/vermiliion/api/main/menu/about.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-backup.sh"
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/vermiliion/api/main/ssh/trial.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/vermiliion/api/main/ssh/usernew.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/vermiliion/api/main/xray/add-tr.sh"
wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/vermiliion/api/main/xray/del-tr.sh"
wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/vermiliion/api/main/xray/cek-tr.sh"
wget -q -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/vermiliion/api/main/xray/trialtrojan.sh"
wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/vermiliion/api/main/xray/renew-tr.sh"
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/vermiliion/api/main/xray/add-ws.sh"
wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/vermiliion/api/main/xray/del-ws.sh"
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/vermiliion/api/main/xray/cek-ws.sh"
wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/vermiliion/api/main/xray/renew-ws.sh"
wget -q -O /usr/bin/trialvmess "https://raw.githubusercontent.com/vermiliion/api/main/xray/trialvmess.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/vermiliion/api/main/xray/add-vless.sh"
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/vermiliion/api/main/xray/del-vless.sh"
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/vermiliion/api/main/xray/cek-vless.sh"
wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/vermiliion/api/main/xray/renew-vless.sh"
wget -q -O /usr/bin/trialvless "https://raw.githubusercontent.com/vermiliion/api/main/xray/trialvless.sh"
wget -q -O add-ss "https://raw.githubusercontent.com/vermiliion/api/main/xray/add-ss.sh"
wget -q -O trialss "https://raw.githubusercontent.com/vermiliion/api/main/xray/trialss.sh"
wget -q -O del-ss "https://raw.githubusercontent.com/vermiliion/api/main/xray/del-ss.sh"
wget -q -O renew-ss "https://raw.githubusercontent.com/vermiliion/api/main/xray/renew-ss.sh"
wget -q -O cek-ss "https://raw.githubusercontent.com/vermiliion/api/main/xray/cek-ss.sh"
wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/vermiliion/api/main/menu/menu-trial.sh"
chmod +x /usr/bin/usernew
chmod +x /usr/bin/auto-reboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearcache
chmod +x /usr/bin/running
chmod +x /usr/bin/speedtest
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu-webmin
chmod +x /usr/bin/menu-warp
chmod +x /usr/bin/menu-nubz
chmod +x /usr/bin/menu-nob
chmod +x /usr/bin/menu-bot
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/xp
chmod +x /usr/bin/update
chmod +x /usr/bin/add-host
chmod +x /usr/bin/certv2ray
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/about
chmod +x /usr/bin/add4
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/trial
chmod +x /usr/bin/usernew
chmod +x /usr/bin/add-tr
chmod +x /usr/bin/del-tr
chmod +x /usr/bin/cek-tr
chmod +x /usr/bin/trialtrojan
chmod +x /usr/bin/renew-tr
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/del-ws
chmod +x /usr/bin/cek-ws
chmod +x /usr/bin/renew-ws
chmod +x /usr/bin/trialvmess
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/del-vless
chmod +x /usr/bin/cek-vless
chmod +x /usr/bin/renew-vless
chmod +x /usr/bin/trialvless
chmod +x /usr/bin/add-ss
chmod +x /usr/bin/trialss
chmod +x /usr/bin/del-ss
chmod +x /usr/bin/cek-ss
chmod +x /usr/bin/renew-ss
chmod +x /usr/bin/menu-trial
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
