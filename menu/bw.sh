#!/bin/bash

# Mendapatkan IP VPS
MYIP=$(wget -qO- ipinfo.io/ip)

# Warna
BIYellow='\033[1;93m' # Bold Intense Yellow
NC='\033[0m' # No Color

clear 

# Header Menu Bandwidth Monitor
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "${BIYellow} \E[40;1;37m             • BANDWIDTH MONITOR •               \E[0m${BIYellow}  ${NC}"
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e "" 
echo -e " [\e[36m•1\e[0m] Lihat Total Bandwidth Tersisa"
echo -e " [\e[36m•2\e[0m] Tabel Penggunaan Setiap 5 Menit"
echo -e " [\e[36m•3\e[0m] Tabel Penggunaan Setiap Jam"
echo -e " [\e[36m•4\e[0m] Tabel Penggunaan Setiap Hari"
echo -e " [\e[36m•5\e[0m] Tabel Penggunaan Setiap Bulan"
echo -e " [\e[36m•6\e[0m] Tabel Penggunaan Setiap Tahun"
echo -e " [\e[36m•7\e[0m] Tabel Penggunaan Tertinggi"
echo -e " [\e[36m•8\e[0m] Statistik Penggunaan Setiap Jam"
echo -e " [\e[36m•9\e[0m] Lihat Penggunaan Aktif Saat Ini"
echo -e " [\e[36m10\e[0m] Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e "" 
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e " [\e[31m•x\e[0m] Keluar"
echo -e "" 
echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
echo -e ""

# Membaca pilihan pengguna
read -p " Pilih menu : " opt
echo -e ""

# Logika untuk setiap pilihan menu
case $opt in
1)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m • TOTAL BANDWIDTH SERVER TERSISA • \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
2)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m • TOTAL BANDWIDTH SETIAP 5 MENIT • \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -5
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
3)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m   • TOTAL BANDWIDTH SETIAP JAM •   \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -h
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
4)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m  • TOTAL BANDWIDTH SETIAP HARI •   \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -d
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
5)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m  • TOTAL BANDWIDTH SETIAP BULAN •  \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -m
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
6)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m  • TOTAL BANDWIDTH SETIAP TAHUN •  \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -y
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
7)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m    • TOTAL BANDWIDTH TERTINGGI •   \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -t
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
8)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m • STATISTIK TERPAKAI SETIAP JAM • \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -hg
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
9)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m     • LIVE BANDWIDTH SAAT INI •    \e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e   " Tekan [ Ctrl+C ] untuk keluar"
    echo -e ""
    vnstat -l
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
10)
    clear 
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e "\E[40;1;37m• LIVE TRAFIK PENGGUNAAN BANDWIDTH •\e[0m"
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    vnstat -tr
    echo -e ""
    echo -e "${BIYellow} ─────────────────────────────────────────────────────${NC}"
    echo -e ""
    read -n 1 -s -r -p "Tekan sembarang tombol untuk kembali ke menu"
    bw
    ;;
0)
    sleep 1
    menu
    ;;
x)
    exit
    ;;
*)
    echo -e ""
    echo -e "Anda salah memilih opsi!"
    sleep 1
    bw
    ;;
esac
