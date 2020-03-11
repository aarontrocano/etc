<#

#>
$env:HostIP = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration | 
    Where-Object {
        $_.DefaultIPGateway -ne $null
    }
).IPAddress | 
select-object -first 1