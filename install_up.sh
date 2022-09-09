#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/scvpn/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/scvpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/scvpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Remove Old Script"
rm /usr/bin/menu
sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Downloading New Script"
# wget -q -O /usr/bin/FILENAME "https://raw.githubusercontent.com/kamunikan/update/main/update_file/FILENAME" && chmod +x /usr/bin/FILENAME

wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/kamunikan/update/main/update_file/clearlog.sh" && chmod +x /usr/bin/clearlog
#echo "0 */2 * * * /usr/bin/clearlog" >>/tmp/crontab.xPrSIm/crontab


#wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-ss.sh" && chmod +x /usr/bin/menu-ss
#wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
#wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-vless.sh" && chmod +x /usr/bin/menu-vless
#wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
#wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-bot.sh" && chmod +x /usr/bin/menu-bot
#wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
#wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-set.sh" && chmod +x /usr/bin/menu-set
#wget -q -O /usr/bin/menu-theme "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-theme.sh" && chmod +x /usr/bin/menu-theme
#wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-backup.sh" && chmod +x /usr/bin/menu-backup
#wget -q -O /usr/bin/menu-ip "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-ip.sh" && chmod +x /usr/bin/menu-ip
#wget -q -O /usr/bin/menu-tor "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-tor.sh" && chmod +x /usr/bin/menu-tor
#wget -q -O /usr/bin/autoboot "https://raw.githubusercontent.com/kamunikan/update/main/update_file/autoboot.sh" && chmod +x /usr/bin/autoboot
#wget -q -O /usr/bin/menu-tcp "https://raw.githubusercontent.com/kamunikan/update/main/update_file/menu-tcp.sh" && chmod +x /usr/bin/menu-tcp
#wget -q -O /usr/bin/rebootvps "https://raw.githubusercontent.com/kamunikan/update/main/update_file/rebootvps.sh" && chmod +x /usr/bin/rebootvps
sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Download Changelog File"
wget -q -O /root/clog.txt "https://raw.githubusercontent.com/kamunikan/update/main/update_file/clog.txt" && chmod +x /root/clog.txt
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Read Clog? ./root/clog.txt"
sleep 2
