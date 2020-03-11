$Report = @()
$Report | Format-Table DisplayName,whenCreated,ForwardingSMTPAddress,PrimarySMTPAddress -Autosize -Wrap
$ReportAscend = @()
$ReportAscend = $Report | Sort-Object -Property DisplayName | Select-Object DisplayName,whenCreated,PrimarySMTPAddress,ForwardingSMTPAddress
$SharePoint = @()
$SharePoint = $ReportAscend | ForEach-Object -Process {$_} | Select-Object -Property @{Name = 'SourceValue'; Expression = {$_.PrimarySmtpAddress}}, @{Name = 'DestinationValue'; Expression = {$_.ForwardingSmtpAddress -replace '^smtp:' -join ';'}}, @{Name = 'whenCreated'; Expression = {$_.whenCreated}}
$SharePoint | Select-Object SourceValue,DestinationValue,whenCreated | Export-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\SharePoint_UserMapping.csv') -NoTypeInformation