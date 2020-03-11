<# Write-Output should be used when you want to send data on in the pipe line, but not necessarily want to display it on screen. The pipeline will eventually write it to out-default if 
   nothing else uses it first. Write-Host should be used when you want to do the opposite. [console]::WriteLine is essentially what Write-Host is doing behind the scenes. #>
Write-Output ("Hello, World!")