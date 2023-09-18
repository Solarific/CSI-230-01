echo hello, please enter a valid binary ip

read binip
binoctone=$(echo "$(( 2#${binip:0:8}))")
binocttwo=$(echo "$(( 2#${binip:8:8}))")
binoctthree=$(echo "$(( 2#${binip:16:8}))")
binoctfour=$(echo "$(( 2#${binip:24:8}))")

echo "${binoctone}"."${binocttwo}"."${binoctthree}"."${binoctfour}"

