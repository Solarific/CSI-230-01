echo "provide an ip"
read userip
echo "what is the ip prefix 24/16"
read prefix

userip1=$( echo "${userip}" | cut -d '.' -f 1 )
userip2=$( echo "${userip}" | cut -d '.' -f 2 )
userip3=$( echo "${userip}" | cut -d '.' -f 3 )
userip4=$( echo "${userip}" | cut -d '.' -f 4 )
binaryip1=$(echo "obase=2;$userip1" | bc)
binaryip2=$(echo "obase=2;$userip2" | bc)
binaryip3=$(echo "obase=2;$userip3" | bc)
binaryip4=$(echo "obase=2;$userip4" | bc)
 x=0
if [[ "${prefix}" -eq 16 ]]
then
   for i in {1..254}
     do
       binaryip3=$(echo "obase=2;$i" | bc)
   for i in {1..254}
     do
       binaryip4=$(echo "obase=2;$i" | bc)
	((x++))
       echo $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip1}))))$binaryip1 $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip2}))))$binaryip2 $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip3}))))$binaryip3  $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip4}))))$binaryip4 >> BinaryIP.txt
      
done
done
fi



if [[ "${prefix}" -eq 24 ]]
   then
	for i in {1..254}
  do
       binaryip4=$(echo "obase=2;$i" | bc)

	echo  $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip1}))))$binaryip1 $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip2}))))$binaryip2 $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip3}))))$binaryip3 $(printf -- 0%.s $(seq -s ' ' $((8-${#binaryip4}))))$binaryip4 >> BinaryIP.txt 
      
  done
fi
