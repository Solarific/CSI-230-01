$chrome = Get-Process | where { $_.ProcessName -eq "chrome" } | `
select Id, ProcessName, StartTime

if($chrome -ne $null){
Write-Host "Here are the processes"
Write-Host $chrome

Write-Host "Closing"
Stop-Process -Name "chrome"

}
else {
Write-Host "No instance of chrome were found running." 
Write-Host "Starting one"

Start-Process '"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk"'  `
'https://www.champlain.edu/'
}