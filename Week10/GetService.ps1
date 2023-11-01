$arrayVal = @('all','stopped','running')
$services = Get-Service

function prompt_user() {
$readLog = Read-Host -Prompt `
"Would you like to view all services, only those stopped, or those currently running? (please type 'all','stopped', 'running', or 'Q/q' to quit) "

if ($readLog -match "^[qQ]$"){ break }

if ($arrayVal -notcontains $readLog ){
    Write-Host "Invalid Input, please try again"
    prompt_user
}


function get_logs(){

if ($readLog -eq $arrayVal[0]){ $services }
if ($readLog -eq $arrayVal[1]){ $services | where {$_.Status  -eq $arrayVal[1]} | Sort-Object }
if ($readLog -eq $arrayVal[2]){ $services | where {$_.Status  -eq $arrayVal[2]} | Sort-Object }
}

get_logs
prompt_user

}

prompt_user

