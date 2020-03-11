<#
  Purge PDF files older than 2 weeks, Per Ramesh Kandasamy, 5/7/2019
#>
$Computer = 'dev-webgm02'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Receipt",
  "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Pay Plan",
  "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted",
  "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\ContractPrinted",
  "\\$($Computer)\c$\inetpub\wwwroot\Staging.VSCOnlineGM\ContractPrinted"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}


<#
  Purge PDF files older than 2 weeks, Per Ramesh Kandasamy, 5/7/2019
#>
$Computer = 'dev-webgm03'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\ContractPrinted",
  "\\$($Computer)\c$\inetpub\wwwroot\Staging.VSCOnlineGM\ContractPrinted"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}

<#
  Purge PDF files older than 1 week, Per Ramesh Kamdasamy
#>
<#
  DEV-WEBGM02
  C:\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\
  C:\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Receipt\
  C:\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Pay Plan\

#>
$Computer = 'dev-webgm02'
$arr = "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted",
  "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Receipt",
  "\\$($Computer)\c$\inetpub\wwwroot\Stagingwebservice.extendedprotectiononline.com\GMDGatewayAPI\ContractPrinted\Pay Plan"
$limit = (Get-Date).AddDays(-7)
foreach ($pdfloc in $arr)
{
  Get-ChildItem -Path $pdfloc | Where-Object { -not $_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item
}

<#
  Purge PDF files older than 2 weeks, Per Ramesh Kandasamy, 5/7/2019
#>
$Computer = 'bedpstvsc01'
$arr = "\\$($Computer)\D$\WebConfigs\New Vsc Cluster\Report\AdminReports"
$limit = (Get-Date).AddDays(-14)
$Computer = 'bedpstvsc01'
$arr = "\\$($Computer)\D$\WebConfigs\New Vsc Cluster\ContractPrinted"
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