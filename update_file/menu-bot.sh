#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/scvpn/theme/color.conf)
NC="\e[0m"
export GREEN='\033[0;32m';
RED="\033[0;31m" 
COLOR1="$(cat /etc/scvpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/scvpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

function testbot(){
clear
bcc=`date`
DOM=$(cat /etc/xray/domain)
ADMIN=$(cat ./bot/ADMINID)
CHATID="$ADMIN"
API_TOKEN=$(cat ./bot/BOTAPI)
TIME="5"
BRL="https://api.telegram.org/bot$API_TOKEN/sendMessage"
TEXT="<b> 💬 TESTING BOT</b>
 🔸 Just For Testing
<b>━━━━━━━━━━━━━━━━</b>
 🌏 SERVER <b>$DOM</b>
 
 🔥 BOT BY @DOTYCAT
<b>━━━━━━━━━━━━━━━━</b>
 🕧 $bcc
<b>━━━━━━━━━━━━━━━━</b>"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $BRL >/dev/null
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}                 • BOT PANEL •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   [INFO] Chat Sent Successfully"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-bot
}


function resetbot(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}                 • BOT PANEL •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC}   [INFO] Bot Reset Successfully"
echo "OFF" > ./bot/status
rm ./bot/ADMINID
rm ./bot/BOTAPI
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-bot
}
function setbot(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}                 • BOT PANEL •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"

read -p "│   ADMIN ID : " ADMINID
if [ -z $ADMINID ]; then
echo -e "$COLOR1│${NC} "
echo -e "$COLOR1│${NC}   [ERROR] Please Input Your ADMIN ID"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-bot
else
echo "$ADMINID" > ./bot/ADMINID
fi

read -p "│   BOT API  : " BOTAPI
if [ -z $BOTAPI ]; then
echo -e "$COLOR1│${NC} "
echo -e "$COLOR1│${NC}   [ERROR] Please Input Your BOTAPI"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-bot
else
echo "$BOTAPI" > ./bot/BOTAPI
echo "ON" > ./bot/status
fi
echo -e "$COLOR1│${NC} "
echo -e "$COLOR1│${NC}   [INFO] Bot Setup Successfully"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo ""
read -n 1 -s -r -p "  Press any key to back on menu"
menu-bot
}
clear
DIR="./bot/"
if [ -d "$DIR" ]; then
  recekk="ok"
  else
  mkdir ./bot
  echo "OFF" > ./bot/status
fi
stst=$(cat ./bot/status)
if [ "$stst" = "OFF" ]; then
BOTTZ="SET BOT"
MENUZZ="setbot"
testbot="setbot"
else
MENUZZ="resetbot"
BOTTZ="RESET BOT"
testbot="testbot"
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}                 • BOT PANEL •                 ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│$NC   ${COLOR1}[01]${NC} • $BOTTZ         ${COLOR1}[02]${NC} • TEST BOT"
echo -e "$COLOR1│$NC"
echo -e "$COLOR1│$NC   $COLOR1[00]$NC • GO BACK"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.DOTYCAT.COM •                $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; $MENUZZ ;;
02 | 2) clear ; $testbot ;;
00 | 0) clear ; menu ;;
*) clear ; menu-bot ;;
esac
