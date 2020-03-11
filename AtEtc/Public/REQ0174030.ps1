<#

#>
<#--Save existing config:--#>
#Get-Recipient -ResultSize Unlimited -Identity user | Select-Object -ExpandProperty EmailAddresses | Format-List

<#
Get-Recipient -ResultSize Unlimited -Identity user | Set-Mailbox -PrimarySmtpAddress 'user@example.com'
Get-Recipient -ResultSize Unlimited -Identity user | Set-Mailbox -EmailAddresses @{Remove='smtp:user@example.net'}
#>

<#
Get-Recipient -ResultSize Unlimited -Identity 15811 | Select-Object -ExpandProperty EmailAddresses | Format-List
#>


$oldemail = 'user@example.net'
$newemail = 'user@example.com'
$scriptBlock = {
    param (
        [string]$strAlias,
        [string]$strFwd
    ) 
    Set-Mailbox -Identity $strAlias -DeliverToMailboxAndForward $false -ForwardingAddress $null -ForwardingSMTPAddress $strFwd 
} 
Write-Host ($oldemail + ' to ' + $newemail)
Invoke-Command -Session $Session -ScriptBlock $scriptBlock -ArgumentList $oldemail, $newemail    
Write-Host ('Done !')
