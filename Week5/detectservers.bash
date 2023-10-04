input=activehost.txt

while file= read -r line
do

output=$(curl --head "${line}" | grep "HTTP")

if [[ "${output}" -eq "HTTP" ]]
then
echo "${line}" > webservers.txt
fi

done < "$input"
