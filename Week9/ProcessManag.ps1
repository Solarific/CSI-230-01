<# $time = Get-Date

$startTime = $time.AddHours(-1)

Get-Process |  Where-Object {$_.ProcessName -like 'C*'} | Where-Object { $_.StartTime -ge $startTime} | 
select Id, ProcessName, StartTime #>

#Get-Process | Where-Object {$_.Path -notlike '*\System32\*'} | select Id, ProcessName, Path

<#$folderPath = "C:\Users\roflw\CSI-230-01\Week9\"
$filePath =  Join-Path $folderPath "stopped.csv"
Get-Service | Where-Object { $_.status -eq “stopped”} | Sort-Object | Export-Csv -Path $filePath#>

#Get-ChildItem | Where-Object { $_.Extension -eq ".ps1" } | Sort-Object CreationTime

$folderPath = "C:\Users\roflw\CSI-230-01\Week9\"
$filePath =  Join-Path $folderPath "FileCreation.csv"

$date =Get-Date -Format "MM/dd/yyyy HH:mm" "10/27/2023" 

Get-ChildItem $folderPath | Where-Object { $_.CreationTime -gt $date } | Sort-Object CreationTime | select Name, CreationTime | Export-Csv -Path $filePath -NoTypeInformation


