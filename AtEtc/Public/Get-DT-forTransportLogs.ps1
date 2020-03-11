$dtEnd = (Get-Date)
$dtStart = (Get-Date).AddDays(-4.5)
Write-Host ($dtEnd.ToString() + ' | ' + $dtStart.ToString() )