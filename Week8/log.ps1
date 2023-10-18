cd C:\Users\roflw\Downloads
clear 
Get-EventLog -list

$readlog = Read-host -Prompt "Please select a log to review"

Get-Event -LogName $readlog -Newest 3 | export -csv -NoTypeInformation -Path "C:\Users\roflw\Downloads\rep.csv"