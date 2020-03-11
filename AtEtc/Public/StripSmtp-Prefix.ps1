$Report = @()
$Out = $Report | ForEach-Object -Process {$_} | Select-Object -Property @{Name = 'DestinationValue'; Expression = {$_.ForwardingSmtpAddress -replace '^smtp:' -join ';'}}, @{Name = 'SourceValue'; Expression = {$_.PrimarySmtpAddress}}, @{Name = 'whenCreated'; Expression = {$_.whenCreated}}
$Out