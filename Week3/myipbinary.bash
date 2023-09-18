ip=$(bash myip.bash)

myip1=$( echo "${ip}" | cut -d '.' -f 1 )
myip2=$( echo "${ip}" | cut -d '.' -f 2 )
myip3=$( echo "${ip}" | cut -d '.' -f 3 )
myip4=$( echo "${ip}" | cut -d '.' -f 4 )

#echo "${myip1}"
#echo "${myip2}"
#echo "${myip3}"
#echo "${myip4}"

ip1binary=$(echo "obase=2;$myip1" | bc)
ip2binary=$(echo "obase=2;$myip2" | bc)
ip3binary=$(echo "obase=2;$myip3" | bc)
ip4binary=$(echo "obase=2;$myip4" | bc)

echo "${ip1binary}""${ip2binary}""000000""${ip3binary}""${ip4binary}" 
