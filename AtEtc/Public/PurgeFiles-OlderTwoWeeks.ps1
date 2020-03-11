<#
  Purge PDF files older than 2 weeks
#>
$Computer = 'host02'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\1",
  "\\$($Computer)\c$\inetpub\wwwroot\2",
  "\\$($Computer)\c$\inetpub\wwwroot\3",
  "\\$($Computer)\c$\inetpub\wwwroot\4",
  "\\$($Computer)\c$\inetpub\wwwroot\5"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}


<#
  Purge PDF files older than 2 weeks
#>
$Computer = 'host03'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\1",
  "\\$($Computer)\c$\inetpub\wwwroot\2"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}

<#
  Purge PDF files older than 1 week
#>
<#
  host02
  C:\inetpub\wwwroot\1
  C:\inetpub\wwwroot\2
  C:\inetpub\wwwroot\3

#>
$Computer = 'host02'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\1",
  "\\$($Computer)\c$\inetpub\wwwroot\2",
  "\\$($Computer)\c$\inetpub\wwwroot\3"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}

<#
  Purge PDF files older than 2 weeks
#>
$Computer = 'hosta01'
$arr = "\\$($Computer)\D$\WebConfigs\1"
$limit = (Get-Date).AddDays(-14)
$Computer = 'hostb01'
$arr = "\\$($Computer)\D$\WebConfigs\2"
$limit = (Get-Date).AddDays(-14)
foreach ($pdfloc in $arr){ Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item }


<#
  Purge PDF files older than 6 months, Per Lakshmi Anandaprasad <Lakshmi.Anandaprasad@amyntagroup.com>, 7/3/2019
#>
$Computer = 'amt-webwsol02'
$arr = "\\$($Computer)\d$\WarrantySolutions1\b2b\generatedpdf",
  "\\$($Computer)\d$\WarrantySolutions1\REPORTS",
  "\\$($Computer)\d$\Logs"
$limit = [datetime]'12/31/2018 11:59:59PM'
$limit = (Get-Date).AddDays(-185).AddHours(-8)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}


<#
  Purge PDF files older than 6 months, Per Lakshmi Anandaprasad <Lakshmi.Anandaprasad@amyntagroup.com>, 7/3/2019
#>
$Computer = 'amt-webwsol01'
$arr = "\\$($Computer)\d$\WarrantySolutions1\b2b\generatedpdf",
  "\\$($Computer)\d$\WarrantySolutions1\REPORTS",
  "\\$($Computer)\d$\Logs"
$limit = [datetime]'12/31/2018 11:59:59PM'
$limit = (Get-Date).AddDays(-185).AddHours(-8)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}