#cat BinaryIP.txt

input=IPBinary.txt

while file= read -r line
do

binoctone=$(echo "$(( 2#${line:0:8}))")
binocttwo=$(echo "$(( 2#${line:10:8}))")
binoctthree=$(echo "$(( 2#${line:18:8}))")
binoctfour=$(echo "$(( 2#${line:27:8}))")

echo "${binoctone}"."${binocttwo}"."${binoctthree}"."${binoctfour}"
done < "$input" >> PossibleIP.txt
