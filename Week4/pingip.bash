input=PossibleIP.txt

while file= read -r line
do
echo "${line}"
output=$(ping -c 1 -w 1 "${line}" | grep ttl |  cut -d '=' -f 2 | cut -c 3- )
echo "$output"
if [[ ${output} == "ttl" ]]
   then
	echo "I am Alive"
	echo "${line}" >> activehost.txt
fi
done < "$input" #>> PossibleIP.txt

