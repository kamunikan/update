#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/scvpn/theme/color.conf)
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
NC="\e[0m"
RED="\033[0;31m" 
COLOR1="$(cat /etc/scvpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/scvpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

MYIP=$(wget -qO- ipinfo.io/ip);
clear
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC$COLBG1                • AUTO REBOOT •                $COLOR1 │$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC • Example : "
echo -e "$COLOR1│ $NC   0     = 12 PM"
echo -e "$COLOR1│ $NC   12    = 12 AM"
echo -e "$COLOR1│ $NC   13-23 = 1 AM - 11 PM"
echo -e "$COLOR1│ $NC   1-11  = 1 PM - 11 AM"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC Auto Reboot :${green} Every $aureb $gg ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""

while :; do
  read -p "   Auto Reboot Time 0 - 23 : " tr2
  if [ -z $tr2 ]; then
  menu-set
  fi
  [[ $tr2 =~ ^[0-9]+$ ]] || { echo -ne; continue; }
  if ((tr2 >= 0 && tr2 <= 23)); then
    echo -ne
    break
  else
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC$COLBG1                • AUTO REBOOT •                $COLOR1 │$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC Error"
echo -e "$COLOR1│ $NC"
echo -e "$COLOR1│ $NC • Autoreboot : ${red} Can't be more than 23 ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
  fi
done

if [ -z $tr2 ]; then
echo "..."
exit 0
fi

if [ $tr2 -le 11 ]
then
beha=$(cat /home/re_otm)
echo "$tr2" > /home/re_otm
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 $tr2 * * * root /sbin/reboot
END
sed -i "/Autoreboot/c\   - Autoreboot On           : $tr2:00 AM [GMT+8]" /root/log-install.txt
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC$COLBG1                • AUTO REBOOT •                $COLOR1 │$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC Auto Reboot Active Successfully"
echo -e "$COLOR1│ $NC"
echo -e "$COLOR1│ $NC • Autoreboot : ${green} Active Every $tr2 AM ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
else
beha=$(cat /home/re_otm)
echo "$tr2" > /home/re_otm
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 $tr2 * * * root /sbin/reboot
END
sed -i "/Autoreboot/c\   - Autoreboot On           : $tr2:00 PM  [GMT+8]" /root/log-install.txt
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC$COLBG1                • AUTO REBOOT •                $COLOR1 │$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│ $NC Auto Reboot Active Successfully"
echo -e "$COLOR1│ $NC"
echo -e "$COLOR1│ $NC • Autoreboot : ${green} Active Every $tr2 PM ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
fi
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu-set