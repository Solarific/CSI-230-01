List_IP () {
cat /var/log/apache2/access.log | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq > clientIPs.txt
}

Visitors () {
input=clientIPs.txt

while file= read -r line
do
echo "$line"
cat /var/log/apache2/access.log | grep $(date +"%d/%b/%Y") | grep "$line" | wc -l  | sed 's/$/ Times found/'
done < "$input"
}

bad_Clients () {
input=clientIPs.txt

while file= read -r line
do

#x = cat /var/log/apache2/access.log | cut -d ':' -f2
#y = date +"%d/%b/%Y/%T" | cut -d '/' -f4 | cut -c 1,2
cat /var/log/apache2/access.log | grep "$line" | egrep $(date +"%d/%b/%Y/%T:0[0-24]") | grep -E '400|403|404' | wc -l 

done < "$input"
}

userchoice=0

while [ "${userchoice}" -ne 7 ]
do

echo "[1] Number of Visitors"
echo "[2] Display of Visitors"
echo "[3] Show Bad Visits"
echo "[4] Bl9ock Bad Visits"
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

done
