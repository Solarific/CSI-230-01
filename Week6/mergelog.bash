logs="/var/log/apache2/"

alllogs=$((ls "${logs}") | grep "access.log" | grep -v "other_vhost" | grep -v "error")

for i in ${alllogs}
do
cat "${logs}${i}" >> mergedlogs.txt

done
#cat "${alllogs}" | echo "${alllogs}" > mergedlogs.txt
tail mergedlogs.txt
