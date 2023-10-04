List_IP () {
cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq > clientIPs.txt
}

Visitors () {
input=clientIPs.txt

while file= read -r line
do

count=$(cat /var/log/apache2/access.log | grep $(date +"%d/%b/%Y") | grep "$line" -c )
echo "${count}" "$line"
done < "$input"
}

bad_Clients () {
input=clientIPs.txt

while file= read -r line
do

count=$(cat /var/log/apache2/access.log | grep "${line}" | grep $(date +"%d/%b/%Y:%H:[0-9][0-9]") | cut -c 50- | grep -c -E  '400|403|404'  )

if [[ "${count}" -ge  3 ]]
then
echo -e  "${line}" >> blacklisted.txt
fi

done < "$input"
echo "IPS Blacklisted"
cat blacklisted.txt
}

histogram ()
{

count=$(cat /var/log/apache2/access.log | grep $(date +"%d/%b/%Y") | grep "$line" | grep -c "200" | sed 's/$/ Visits today!/' )
echo "${count}"

}

block () 
{

input=blacklisted.txt

while file= read -r line
do

sudo iptables -A INPUT -s "${line}" -j DROP

done < "$input"
iptables -L -v
}

resetblocks () 
{

input=blacklisted.txt

while file= read -r line
do
sudo iptables -D INPUT -s "${line}" -j DROP

done < "$input"
iptables -L -v
}

userchoice=0

while [ "${userchoice}" -ne 7 ]
do

echo "[1] Number of Visitors"
echo "[2] Display of Visitors"
echo "[3] Show Bad Visits"
echo "[4] Block Bad Visits"
echo "[5] Reset Block Rules"
echo "[6] Show Visit Histogram"
echo "[7] Quit"

read userchoice

	if [[ "$userchoice" -eq 1 ]]
	then
	  List_IP
	fi

	if [[ "$userchoice" -eq 2 ]]
        then
		Visitors
        fi

	if [[ "$userchoice" -eq 3 ]]
        then
                bad_Clients
        fi
        if [[ "$userchoice" -eq 4 ]]
        then
                block
        fi

if [[ "$userchoice" -eq 5 ]]
        then
               resetblocks
        fi

 if [[ "$userchoice" -eq 6 ]]
        then
                histogram
        fi
 if [[ "$userchoice" -lt 1 || "$userchoice" -gt 7 ]]
        then
                echo "invalid choice!, try again!"
        fi

done
