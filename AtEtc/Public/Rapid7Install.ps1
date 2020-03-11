New-Item -ItemType Directory -Path c:\InsightAgent
$Source = $PSScriptRoot
$Dest = "C:\InsightAgent"
robocopy $Source $Dest
Set-Location $Dest
$Args = '/i agentInstaller-x86_64.msi /Lv "C:\Windows\Logs\Rapid7agentinstaller-x86_x64.log" /quiet /qn'
Start-Process msiexec.exe -ArgumentList $Args -Wait