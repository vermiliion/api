#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
w="\033[97m"
f="\033[1;97;41m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[95m"
YELL='\033[0;33m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H-%M-%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
izinsc="https://raw.githubusercontent.com/Lite-VPNvermiliion/api/main/register"
# USERNAME
rm -f /usr/bin/user
username=$(curl ${izinsc} | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status Expired Or Active
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipv4.icanhazip.com)
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON${NC}"
else
   status_ssh="${RED}OF${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON${NC}"
else
    status_ws_epro="${RED}OF${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON${NC}"
else
   status_haproxy="${RED}OF${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON${NC}"
else
   status_xray="${RED}OF${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON${NC}"
else
   status_nginx="${RED}OF${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON${NC}"
else
   status_dropbear="${RED}OF${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#!# " "/etc/xray/config.json")
let ssa=$ssx/2
###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########
r="\033[1;31m"  #REDTERANG
echo -e " "
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC${f}                   AUTO SCRIPT LITE                      $NC${z} $NC"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y Server RAM ${NC}    $Blue=$NC $tram / $uram MB $NC"
echo -e " ${w} $NC$r ⇲ $NC$y Uptime Server ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y Date ${NC}          $Blue=$NC $DATEVPS${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y Time ${NC}          $Blue=$NC $TIMEZONE${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y IP VPS ${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " ${w} $NC$r ⇲ $NC$y Domain ${NC}        $Blue=$NC $domain${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w}     SSH$y=$w $ssh1" "Vmess${w}$y=$w $vma" "Vless${w}$y=$w $vla" "Trojan${w}$y=$w $trb" "Shadowsocks${w}$y=$w $ssa"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w}  ${NC}$y Ssh$NC : $status_ssh" "        $y Nginx$NC : $status_nginx" "        $y V2ray$NC : $status_xray         $NC${w} $NC" 
echo -e " ${w}  ${NC}$y WS-ePRO$NC : $status_ws_epro" "    $y Dropbear$NC : $status_dropbear" "     $y Haproxy$NC : $status_haproxy      $NC${w} $NC" 
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC [${w}01${NC}]$w SSH$NC     ${w} $NC [${w}08${NC}]$w DELL ALL EXP$NC ${w} $NC [${w}15${NC}]$w BCKP/RSTR   $NC${w} $NC"
echo -e " ${w} $NC [${w}02${NC}]$w VMESS$NC   ${w} $NC [${w}09${NC}]$w AUTOREBOOT$NC  ${w}  $NC [${w}16${NC}]$w REBOOT      $NC${w} $NC"    
echo -e " ${w} $NC [${w}03${NC}]$w VLESS$NC   ${w} $NC [${w}10${NC}]$w INFO PORT$NC   ${w}  $NC [${w}17${NC}]$w RESTART     $NC${w} $NC"   
echo -e " ${w} $NC [${w}04${NC}]$w TROJAN$NC  ${w} $NC [${w}11${NC}]$w SPEEDTEST$NC   ${w}  $NC [${w}18${NC}]$w DOMAIN      $NC${w} $NC" 
echo -e " ${w} $NC [${w}05${NC}]$w SHADOW$NC  ${w} $NC [${w}12${NC}]$w RUNNING$NC     ${w}  $NC [${w}19${NC}]$w CERT SSL    $NC${w} $NC"
echo -e " ${w} $NC [${w}06${NC}]$w TRIAL$NC   ${w} $NC [${w}13${NC}]$w CLEAR LOG$NC   ${w}  $NC [${w}20${NC}]$w INS. UDP    $NC${w} $NC"
echo -e " ${w} $NC [${w}07${NC}]$w CEK CPU$NC ${w} $NC [${w}14${NC}]$w CREATE SLOW$NC ${w}  $NC [${w}21${NC}]$w CLEAR CACHE $NC${w} $NC"
echo -e " ${w} $NC [${w}22${NC}]$w BANDWITH$NC ${w}$NC [${w}23${NC}]$w UPDATE SCRIPT$NC${w}|$NC [${w}24${NC}]$w MENU BOT $NC${w} $NC"
echo -e " ${w}                                                           $NC${w} $NC"
echo -e " ${w} $NC [${w}25${NC}]$w GANTI BANNER SSH$NC \E[0m\033[0;34m                              $NC${w} $NC"
echo -e " ${w} $NC [${w}26${NC}]$w LOG CREATE USER ACCOUNT \E[0m\033[0;34m                        $NC${w} $NC"
echo -e " ${w} $NC [${w}27${NC}]$w INSTALL WARP \E[0m\033[0;34m                           $NC${w} $NC"
echo -e " ${w} $NC [${w}28${NC}]$w NOOBZVPNS MANAGER$NC${w} $NC"
echo -e " ${w} $NC [${w}29${NC}]$w CREATE NOOBZVPNS $NC${w} $NC"
echo -e " ${w} $NC [${w}30${NC}]$w INSTALL SLOWDNS $NC${w} $NC"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC$y Version$NC       ${Blue}=$NC V3.0"
echo -e " ${w} $NC$y Client Name$NC   ${Blue}=$NC $username"
echo -e " ${w} $NC$y Script Status$NC ${Blue}=$NC $sts "
echo -e " ${w} $NC$y Expiry script$NC $Blue=$w $exp ($r $certifacate ${NC}Days )"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
m-trial
;;
7 | 07)
clear
gotop
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
8 | 08)
clear
xp
echo ""
echo -e " ${GREEN} Back to menu in 1 sec ${NC}"
sleep 1
menu
;;
9 | 09)
clear
autoreboot
;;
10)
clear
prot
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
11)
clear
speedtest
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
12)
clear
run
;;
13)
clear
clearlog
;;
14)
clear
sd
;;
15)
clear
menu-backup
;;
16)
clear
reboot
;;
17)
clear
restart
;;
18)
clear
addhost
;;
19)
clear
fixcert
;;
20)
clear
wget https://raw.githubusercontent.com/Rerechan02/UDP/main/udp.sh && chmod +x udp.sh && ./udp.sh
;;
21)
clear
clearcache
;;
22)
clear
bw
;;
23)
clear
wget -q https://raw.githubusercontent.com/Lite-VPN/v3/main/update.sh
chmod +x update.sh
./update.sh
;;
24)
clear
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC${f}                   BOT MANAGER                $NC${z} $NC"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop BOT CYBERVPN${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall BOT CYBERVPN${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[5]${NC}${rd} Install Bot KYT${NC}"
echo -e "  ${ORANGE}[6]${NC}${rd} Hapus Bot KYT${NC}"
echo -e "  ${ORANGE}[7]${NC}${rd} Stop Bot KYT${NC}"
echo -e "  ${ORANGE}[8]${NC}${rd} Restart Bot KYT${NC}"
echo -e "  ${ORANGE}[9]${NC}${rd} Install Bot KYT For Public${NC}"
echo -e "  ${ORANGE}[10]${NC}${rd} Install Bot Bansos${NC}"
echo -e ""
echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
read -p "  Select From Options [ 1 - 9 or x] : " menu
case $menu in
1) clear ;
    bot2
    ;;
2) clear ;
    restart-bot2
    ;;
3) clear ;
    stop-bot2
    ;;
4) clear ;
    del-bot2
    ;;
5) clear ;
    add-bot
    ;;
6) clear ;
    hapus-bot
    ;;
7) clear ;
    stop-bot
    ;;
8) clear ;
    restart-bot
    ;;
9) clear ;
    add-bot-bersama
   ;;
10) clear ;
    bot-bansos
   ;;   
x)
    menu
   ;;
esac
;;
25)
clear
echo -e "Edit Banner SSH Message " | lolcat
sleep 2
echo -e "Loading..........⏳" | lolcat
sleep 5
nano /etc/kyt.txt
clear
echo -e "${green}ANDA YAKIN UNTUK MEMASANG BANNER INI ? $NC"
echo -e ""
read -p "SILAHKAN PILIH OPSI BERIKUT [Y/N]:" arg
if [[ $arg == 'Y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  echo -e "${green}START. . . $NC"
elif [[ $arg == 'y' ]]; then
  echo -e "${Blue}Tindakan Diteruskan! $NC"
  clear
  echo -e "${Blue}START . . .$NC"
elif [[ $arg == 'N' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  menu
  exit 0
elif [[ $arg == 'n' ]]; then
  echo -e "${RED}Tindakan Dihentikan! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
else
  echo -e "${RED}Argumen Tidak Diketahui! $NC"
  sleep 1
  clear
  rm -f /root/update.sh
  exit 0
fi
##########
clear
reboot
;;
26)
clear
cat /etc/user-create/user.log
echo ""
read -p "Press enter Back To menu"
menu
;;
27)
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e " ${w} $NC${f}               WARP MANAGER             $NC${z} $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Warp Client${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Uninstall Warp Client${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Restart warp Client${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Aktifkan Warp Mode Proxy${NC}"
echo -e "  ${ORANGE}[5].${NC}\033[0;36m Matikankan Warp Mode Proxy${NC}"
echo -e "  ${ORANGE}[6].${NC}\033[0;36m Install Warp Wireguard${NC}"
echo -e "  ${ORANGE}[7].${NC}\033[0;36m Warp Ipv4${NC}"
echo -e "  ${ORANGE}[8].${NC}\033[0;36m Warp Ipv6${NC}"
echo -e "  ${ORANGE}[9].${NC}\033[0;36m Warp Ipv4 & Ipv6${NC}"
echo -e " ${ORANGE}[10].${NC}\033[0;36m Warp Routing IP${NC}"
echo -e " ${ORANGE}[11].${NC}\033[0;36m Restart Warp Wireguard${NC}"
echo -e " ${ORANGE}[12].${NC}\033[0;36m Matikan Warp Wireguard${NC}"
echo -e " ${ORANGE}[13].${NC}\033[0;36m Warp Status${NC}"
echo -e " ${ORANGE}[14].${NC}\033[0;36m Warp Version${NC}"
echo -e " ${ORANGE}[15].${NC}\033[0;36m Help${NC}"
echo -e " ${ORANGE}[16].${NC}\033[0;36m Warp Menu Chinese Special Feature${NC}"
echo -e "  ${ORANGE}[x].${NC}\033[0;36m  Exit ${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
read -p "Select From Options [ 1 - 16 or x ] : " menu
echo -e ""
case $menu in
1)
    bash <(curl -fsSL git.io/warp.sh) install
    ;;
2)
    bash <(curl -fsSL git.io/warp.sh) uninstall
    ;;
3)
    bash <(curl -fsSL git.io/warp.sh) restart
    ;;
4)
    bash <(curl -fsSL git.io/warp.sh) proxy
    ;;
5)
    bash <(curl -fsSL git.io/warp.sh) unproxy
    ;;
6)
    bash <(curl -fsSL git.io/warp.sh) wg
    ;;
7)
    bash <(curl -fsSL git.io/warp.sh) wg4
    ;;
8)
    bash <(curl -fsSL git.io/warp.sh) wg6 
    ;;
9)
    bash <(curl -fsSL git.io/warp.sh) wgd
    ;;
10) 
    bash <(curl -fsSL git.io/warp.sh) wgx
   ;;
11)
    bash <(curl -fsSL git.io/warp.sh) rwg
   ;;
12)
    bash <(curl -fsSL git.io/warp.sh) dwg
   ;;
13)
    bash <(curl -fsSL git.io/warp.sh) status
   ;;
14)
    bash <(curl -fsSL git.io/warp.sh) help
   ;;
15)
    bash <(curl -fsSL git.io/warp.sh) version
   ;;
16)
    bash <(curl -fsSL git.io/warp.sh) menu
   ;;
x)
    menu
    ;;
esac
;;
28)
clear
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w} $NC${f}            NOOBZVPNS MANAGER             $NC${z} $NC"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Noobzvpns${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart Noobzvpns${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop Noobzvpns${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall Noobzvpns${NC}"
echo -e ""
echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
read -p "  Select From Options [ 1 - 4  or x] : " menu
case $menu in
1) clear ;
    git clone https://github.com/noobz-id/noobzvpns.git
    cd noobzvpns/
    ./install.sh
    ;;
2) clear ;
    systemctl restart noobzvpns.service
    ;;
3) clear ;
    systemctl stop noobzvpns.service
    ;;
4) clear ;
    git clone https://github.com/noobz-id/noobzvpns.git
    cd noobzvpns/
   ./uninstall.sh
   ;;
x) clear ;
    menu
   ;;
esac
;;
29)
clear
m-nob
;;
30)
clear
wget https://raw.githubusercontent.com/Lite-VPN/v3/main/files/sdl.sh && chmod +x sdl.sh && ./sdl.sh
;;
0 | 00)
exit
;;
x)
menu
;;
*) clear ;
echo -e ""
menu
;;
esac
