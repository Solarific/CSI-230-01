if  [[ ${#} -eq 0 || ${#} -gt 1 ]]
then 
echo "-----------------------------"
echo "Syntax: ./$0 argument required"
echo "-c Will give a count of x user's login attempts"
echo "-d will show a list of all currently disabled users"
echo "-h will display this menu again"
echo "-----------------------------"
exit
fi

while getopts ":dch" option; do
case $option in
d)
  cat /etc/shadow | grep "*" | cut -d ":" -f 1
;;
c)
while file= read -r line
do
count=$(last "$line" | grep "$line" -c)
echo "$line" "has accessed this computer $count times"
done < usr.txt
;;
h)
echo "-----------------------------"
echo "Syntax: ./$0 [- c/d/h] argument required"
echo "-c Will give a count of x user's login attempts"
echo "-d will show a list of all currently disabled users"
echo "-h will display this menu again"
echo "-----------------------------"
;;
esac
done
