
ip=$(bash myip.bash)
binip=$(bash myipbinary.bash)
subnet=$(bash subnetmask.bash)
network=$(bash mynetworkbinary.bash)


userchoice=0

while [ "${userchoice}" -ne 6 ]
do
echo "please enter a valid number from the list presented"

echo "pleae select an option:"

echo "1-Get my ip adress"
echo "2-Get my ip adress in binary"
echo "3-Get my network mask in binary"
echo "4-Get my network adress in binary"
echo "5-Convert a binary to IP adress"
echo "6-Quit"

read userchoice

  if [[ "${userchoice}" = 1 ]];
     then
      echo "${ip}"
  fi  

if [[ "${userchoice}" = 2 ]];
     then
      echo "${binip}"
  fi  

if [[ "${userchoice}" = 3 ]];
     then
      echo "${subnet}"
  fi  

if [[ "${userchoice}" = 4 ]];
     then
      echo "${network}"
  fi  

if [[ "${userchoice}" = 5 ]];
     then	
     bash convbin2zip.bash
  fi  

done
