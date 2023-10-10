echo "
  <html>
   <head>

  <title>Logs</title>

    <style type=\"text/css\">
	table{background-color:#E1BEE7}
    </style>

   </head>
    <body>

<table border=\"1\"> 
    <tr>
        <th>IP</th>
        <th>Date/Time</th>
        <th>Page Request</th>
        <th>UserAgent</th>
    </tr>
" >> logs.html

while File= read -r line
do

    ip=$(echo "$line" | cut -d ' ' -f 1)
    date=$(echo "$line" |  cut -d '[' -f2 | cut -d '-' -f1)
    pagereq=$(echo "$line" | cut -d '"' -f2 | cut -d ' ' -f 2)
    useragent=$(echo "$line" | cut -d ' ' -f 12)

    echo "
     <tr>
      <td>"$ip"</td>
      <td>"$date"</td>
      <td>"$pagereq"</td>
      <td>"$useragent"</td>
     </tr>
    " >> logs.html
done < mergedlogs.txt

echo "
        </table>
    </body>
</html>" >> logs.html

cp logs.html /var/www/html/logs.html

