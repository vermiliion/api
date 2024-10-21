#!/bin/bash

BURIQ () {
    # Mengunduh daftar register dari URL baru dan menyimpannya ke dalam file sementara
    curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register > /root/tmp
    
    # Mendapatkan IP pengguna saat ini
    MYIP=$(curl -sS ipv4.icanhazip.com)
    
    # Mencari entri yang memiliki IP yang sama dengan pengguna saat ini
    entry=$(grep -E " $MYIP" /root/tmp)
    
    # Jika entri ditemukan, proses tanggal kedaluwarsa
    if [[ -n "$entry" ]]; then
        # Mengambil nama pengguna dan tanggal kedaluwarsa dari entri tersebut
        user=$(echo "$entry" | awk '{print $2}')
        exp=$(echo "$entry" | awk '{print $3}')
        
        # Mengonversi tanggal kedaluwarsa dan tanggal hari ini ke detik sejak epoch
        d1=$(date -d "$exp" +%s)
        d2=$(date +%s) # Hari ini
        
        # Menghitung selisih hari antara hari ini dan tanggal kedaluwarsa
        exp2=$(( (d1 - d2) / 86400 ))
        
        # Jika waktu habis (expired)
        if [[ "$exp2" -le "0" ]]; then
            echo $user > /etc/.$user.ini
        else
            rm -f /etc/.$user.ini > /dev/null 2>&1
        fi
    fi

    # Menghapus file sementara
    rm -f /root/tmp
}

# Mendapatkan IP pengguna saat ini
MYIP=$(curl -sS ipv4.icanhazip.com)

# Mendapatkan nama berdasarkan IP yang sesuai di file register
Name=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | grep $MYIP | awk '{print $2}')

# Menyimpan nama ke file .ini untuk pemeriksaan izin
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
    # Memeriksa apakah file izin untuk user ada
    if [ -f "/etc/.$Name.ini" ]; then
        CekTwo=$(cat /etc/.$Name.ini)
        
        # Memeriksa apakah nama pada file izin cocok
        if [ "$CekOne" = "$CekTwo" ]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION () {
    # Mendapatkan IP pengguna
    MYIP=$(curl -sS ipv4.icanhazip.com)
    
    # Memeriksa apakah IP ada di daftar register
    IZIN=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | awk '{print $4}' | grep $MYIP)
    
    if [ "$MYIP" = "$IZIN" ]; then
        Bloman
    else
        res="Permission Denied!"
    fi
    
    BURIQ
}

# Menjalankan fungsi PERMISSION untuk memulai
PERMISSION
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/register | grep $MYIP | awk '{print $3}')
fi
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
w="\033[97m"
ORANGE="\033[0;34m"
NC='\e[0m'
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek "
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek "
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... "
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... "
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek "
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... "
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
# Date
DATE=$(date +'%d %B %Y')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
}
mai="datediff "$Exp" "$DATE""
export sem=$( curl -s https://raw.githubusercontent.com/vermiliion/api/main/version)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
clear
echo -e "$(figlet   "")" | lolcat
echo -e "${BIWhite} ┌═════════════════════════════════════════════════════┐${NC}"
echo -e "\e[38;5;162m   \e[40;97;1m                    FREENET LITE                   \033[0m \e[38;5;162m\e[0m"
echo -e "${BIWhite} └═════════════════════════════════════════════════════┘${NC}"
echo -e "${BIWhite} ┌═════════════════════════════════════════════════════┐${NC}"
echo -e "${BIWhite} │  ${BIWhite}OS        :  ${BIWhite}$( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )${NC}"
echo -e "${BIWhite} │  ${BIWhite}NS        :  ${BIWhite}$(cat /root/nsdomain)${NC}"
echo -e "${BIWhite} │  ${BIWhite}DOMAIN    :  ${BIWhite}$(cat /etc/xray/domain)${NC}"
echo -e "${BIWhite} │  ${BIWhite}RAM & CPU :  ${BIWhite}$totalram MB / $cpu_usage${NC}"
echo -e "${BIWhite} │  ${BIWhite}SWAP RAM  :  ${BIWhite}$uram / $tram MB${NC}"
echo -e "${BIWhite} │  ${BIWhite}IP VPS    :  ${BIWhite}$IPVPS${NC}"
echo -e "${BIWhite} │  ${BIWhite}REBOOT    :  ${BIWhite}jam 02:00 malam${NC}"
echo -e "${BIWhite} │  ${BIWhite}TELEGRAM  :  ${BIWhite}@Lite_Vermilion${NC}"
echo -e "${BIWhite} └═════════════════════════════════════════════════════┘${NC}"
echo -e "${BIWhite} ┌═════════════════════════════════════════════════════┐${NC}"
echo -e " ${BIWhite}│   ${BIWhite}SSH${NC}    :$ressh"" ${BIWhite}NGINX${NC}    :$resngx"" ${BIWhite}XRAY${NC}   :$resv2r"" ${BIWhite}TROJAN${NC}: $resv2r"
echo -e " ${BIWhite}│   ${BIWhite}STUNNEL${NC}:$resst" "${BIWhite}DROPBEAR${NC} :$resdbr" "${BIWhite}SSH-WS${NC} :$ressshws"
echo -e "${BIWhite} └═════════════════════════════════════════════════════┘${NC}"
echo -e "${BIWhite}           ═══════════════════════════════════${NC}"
echo -e "${BIWhite}                ${BIWhite}SSH    TOTAL ACCOUNT : $ssh1$NC" 
echo -e "${BIWhite}                ${BIWhite}VLESS  TOTAL ACCOUNT : $vla$NC"  
echo -e "${BIWhite}                ${BIWhite}VMESS  TOTAL ACCOUNT : $vma$NC"
echo -e "${BIWhite}                ${BIWhite}TROJAN TOTAL ACCOUNT : $tra$NC"  
echo -e "${BIWhite}           ═══════════════════════════════════${NC}"
echo -e "${BIWhite} ┌═════════════════════════════════════════════════════┐${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}01${BICyan}] SSH           ${NC}  ${BICyan}[${BIWhite}09${BICyan}] ADD-HOST        ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}02${BICyan}] VMESS         ${NC}  ${BICyan}[${BIWhite}10${BICyan}] RUNNING         ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}03${BICyan}] VLESS         ${NC}  ${BICyan}[${BIWhite}11${BICyan}] INSTALL UDP     ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}04${BICyan}] TROJAN        ${NC}  ${BICyan}[${BIWhite}12${BICyan}] INSTALL BOT     ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}05${BICyan}] SETING        ${NC}  ${BICyan}[${BIWhite}13${BICyan}] BANDWITH        ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}06${BICyan}] TRIALL        ${NC}  ${BICyan}[${BIWhite}14${BICyan}] UPDATE SCRIPT   ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}07${BICyan}] BACKUP        ${NC}  ${BICyan}[${BIWhite}15${BICyan}] WARP            ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} │  ${BICyan}[${BIWhite}08${BICyan}] NOOBZ         ${NC}  ${BICyan}[${BIWhite}16${BICyan}] NOOBZ MANAGE    ${NC} ${BIWhite} │${NC}"
echo -e "${BIWhite} └═════════════════════════════════════════════════════┘${NC}"
echo -e "${BIWhite} ┌═════════════════════════════════════════════════════┐${NC}"
echo -e "${BIWhite} │${BIWhite} Version Script : $(cat /opt/.ver) Last Update ${BIWhite}"
echo -e "${BIWhite} │${BIWhite} Username       :\033[1;36m $Name \e[0m"
echo -e "${BIWhite} │${BIWhite} Expired script :${BIWhite} $exp ${BIWhite}:${BIWhite} $exp2${BIWhite} Days${NC}"
echo -e "${BIWhite} └═════════════════════════════════════════════════════┘${NC}"
echo -e ""
read -p "                   Select angka >>> : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-set ;;
6) clear ; menu-trial ;;
7) clear ; menu-backup ;;
9) clear ; add-host ;;
10) clear ; running ;;
11) clear ; clear ; wget https://raw.githubusercontent.com/Rerechan02/UDP/main/udp.sh && chmod +x udp.sh && ./udp.sh ;;
12) clear ; 
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
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/bot2 && chmod +x bot2 && ./bot2
    ;;
2) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/restart-bot2 && chmod +x restart-bot2 && ./restart-bot2
    ;;
3) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/stop-bot2 && chmod +x stop-bot2 && ./stop-bot2
    ;;
4) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/del-bot2 && chmod +x del-bot2 && ./del-bot2
    ;;
5) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/add-bot && chmod +x add-bot && ./add-bot
    ;;
6) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/hapus-bot && chmod +x hapus-bot && ./hapus-bot
    ;;
7) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/stop-bot && chmod +x stop-bot && ./stop-bot
    ;;
8) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/restart-bot && chmod +x restart-bot && ./restart-bot
    ;;
9) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/add-bot-bersama && chmod +x add-bot-bersama && ./add-bot-bersama
   ;;
10) clear ;
    wget https://raw.githubusercontent.com/vermiliion/api/main/botol/bot-bansos && chmod +x bot-bansos && ./bot-bansos
   ;;   
x)
    menu
   ;;
esac
;;
13) clear ; bw ;;
14) clear ; update ;;
15) clear ; 
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "               WARP MANAGER"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Warp Client${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Uninstall Warp Client${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Restart Warp Client${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Aktifkan Warp Mode Proxy${NC}"
echo -e "  ${ORANGE}[5].${NC}\033[0;36m Matikan Warp Mode Proxy${NC}"
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
echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit To Menu ${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
read -p "Select From Options [ 1 - 16 or x ] : " menu
echo -e ""

# Aksi Berdasarkan Input
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
    bash <(curl -fsSL git.io/warp.sh) version
    ;;
15)
    bash <(curl -fsSL git.io/warp.sh) help
    ;;
16)
    bash <(curl -fsSL git.io/warp.sh) menu
    ;;
x)
    menu
    ;;
esac
;;
8) clear ; 
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e " ${w}            NOOBZVPNS MANAGER             ${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"
echo -e "  ${ORANGE}[1].${NC}\033[0;36m Install Noobzvpns${NC}"
echo -e "  ${ORANGE}[2].${NC}\033[0;36m Restart Noobzvpns${NC}"
echo -e "  ${ORANGE}[3].${NC}\033[0;36m Stop Noobzvpns${NC}"
echo -e "  ${ORANGE}[4].${NC}\033[0;36m Uninstall Noobzvpns${NC}"
echo -e ""
echo -e "  ${ORANGE}[x].${NC}\033[0;36m Exit${NC}"
echo -e " ${w}◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇${NC}"

# Membaca input dari pengguna
read -p "  Select From Options [ 1 - 4  or x ] : " menu

# Aksi berdasarkan input pengguna
case $menu in
1) 
    clear
    git clone https://github.com/noobz-id/noobzvpns.git
    cd noobzvpns/
    ./install.sh
    ;;
2) 
    clear
    systemctl restart noobzvpns.service
    ;;
3) 
    clear
    systemctl stop noobzvpns.service
    ;;
4) 
    clear
    git clone https://github.com/noobz-id/noobzvpns.git
    cd noobzvpns/
    ./uninstall.sh
    ;;
x) 
    clear
    exit 0
    ;;
esac
;;
16) clear ; m-nob ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
