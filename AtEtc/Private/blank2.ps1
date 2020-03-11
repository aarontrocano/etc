Clear-Host
<# $Server = 'host'
Invoke-Command -ComputerName $server -ScriptBlock {
$Store = Get-Item 'Cert:\LocalMachine\My'
$Store.Open('readwrite')
$Certs = Get-ChildItem -Path 'Cert:\LocalMachine\My' | Where-Object {$_.Subject -like "*$env:COMPUTERNAME*"}
$Certs | foreach-object {$Store.Remove($_)}
Start-Sleep -Seconds '10'
Start-Process -FilePath 'gpupdate.exe' -ArgumentList '/force'
} #>
<# Test-NetConnection host.example.com -TraceRoute
$tr = Test-NetConnection host.example.com -TraceRoute#>
<#$a = Test-NetConnection host.example.com#>

Get-WMIObject Win32_NetworkAdapterConfiguration <#-ComputerName $s#> -Filter IPEnabled=TRUE | Select-Object -Property [a-z]* -ExcludeProperty IPX*

Where-Object {$_ -is [Microsoft.Exchange.Data.SmtpProxyAddress]}


