#New-Item -ItemType Directory -Path c:\InsightAgent
#$Source = $PSScriptRoot
$Dest = "C:\TrapsAgent"
#robocopy $Source $Dest
Set-Location $Dest
$Args = '/x {1D0AC32D-A786-43A6-A4B5-F2EA35FF93D5} CYVERA_SERVER=traps.amtrustgroup.com USE_SSL_PRIMARY=1 CYVERA_SERVER_PORT=2125 UNINSTALL_PASSWORD=Vd6RdTgERu7dAJMQ'
Start-Process msiexec.exe -ArgumentList $Args -Wait


<#
    Uses Start-Process to kick off the install/uninstall.  
#>