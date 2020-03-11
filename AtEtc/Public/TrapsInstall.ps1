#New-Item -ItemType Directory -Path c:\InsightAgent
#$Source = $PSScriptRoot
$Dest = "C:\TrapsAgent"
#robocopy $Source $Dest
Set-Location $Dest
$Args = '/i Traps_x64_4.1.4.35180.msi CYVERA_SERVER=traps.amtrustgroup.com USE_SSL_PRIMARY=1 CYVERA_SERVER_PORT=2125 UNINSTALL_PASSWORD=@WUFb6#YVA6h /qn'
Start-Process msiexec.exe -ArgumentList $Args -Wait

<#
    Uses Start-Process to kick off the install/uninstall.  
#>