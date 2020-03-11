$RemoteServer = 'host.example.com'
(Get-WmiObject win32_process -ComputerName $RemoteServer) | Where-Object { $_.Name -imatch "wsmprovhost.exe" } | ForEach-Object { $_.Name; $_.Terminate() }