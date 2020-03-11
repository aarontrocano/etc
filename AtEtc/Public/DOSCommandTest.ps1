<#

#>
param(
  [Switch] $Test
)

$arg = "A B C"
$params = @("/a:`"$arg`"")
$params = @("-ano")
if ( $Test ) {
  $params += "/Test"
}
$tempName = [IO.Path]::GetTempFileName()
$output = ""
$spArgs = @{
  "FilePath" = "netstat.exe"
  "ArgumentList" = $params
  "NoNewWindow" = $true
  "Wait" = $true
  "RedirectStandardOutput" = $tempName
}
Start-Process @spArgs
if ( test-path $tempName ) {
  $output = get-content $tempName
  remove-item $tempName
}


Netstat - toy version using Start-Process to invoke it
********
$params = @("-ano")
$tempName = [IO.Path]::GetTempFileName()
<#---Randomly chosen, e.g., C:\Users\atrocano\AppData\Local\Temp\tmp3BB1.tmp ---#>
$spArgs = @{
    "FilePath" = "netstat.exe"
    "ArgumentList" = $params
    "NoNewWindow" = $true
    "Wait" = $true
    "RedirectStandardOutput" = $tempName
}
Start-Process @spArgs
if (Test-path $tempName ) {
    Get-Content $tempName
    #Remove-Item $tempName
}
********