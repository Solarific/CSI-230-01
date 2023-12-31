﻿#(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").IPAddress[1]
#(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet").PrefixLength

#Get-WmiObject -List | where { $_.Name -ilike "Win32_[n][e][t]*" } | Sort-Object

#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Select DHCPServer | Format-Table -HideTableHeaders

#(Get-DnsClientServerAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Wi-Fi").ServerAddresses[0]

<#cd "C:\Users\roflw\CSI-230-01\Week9"
$files=(Get-ChildItem)
for($j=0; $j -le $files.Length; $j++){

if($files[$j].Extension -ilike "*ps1"){
$files[$j].BaseName +$files[$j].Extension
 }
}#>

$folderPather = "C:\Users\roflw\CSI-230-01\Week9\outfolder"
if (Test-Path $folderPather) { Write-Host "Folder Already Exist"}
else { New-Item -ItemType directory -Path $folderPather} 

<#cd "C:\Users\roflw\CSI-230-01\Week9"
$files = (Get-ChildItem)
$folderPath = "C:\Users\roflw\CSI-230-01\Week9\outfolder\"
$filePath =  Join-Path $folderPath "out.csv"

$files | Where-Object {$_.Extension -like ".ps1"} | `
Export-Csv -Path $filePath #>

<#$files = Get-ChildItem -Recurse -File

$files | Rename-Item -NewName { $_.Name -replace '.csv' , '.log' }
Get-ChildItem -Recurse -File#>