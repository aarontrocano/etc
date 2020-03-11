
$report += $objMailbox | Select-Object @{n="Alias";e={$alias} },ForwardingSMTPAddress,ForwardingAddress,DeliverToMailboxandForward

Get-MailboxStatistics -Identity Neil.Fletcher | Format-List ServerName, Database 