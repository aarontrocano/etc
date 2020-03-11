<#

#>
<#--Save existing config:--#>
#Get-Recipient -ResultSize Unlimited -Identity 15811 | Select-Object -ExpandProperty EmailAddresses | Format-List

<#
Get-Recipient -ResultSize Unlimited -Identity 15811 | Set-Mailbox -PrimarySmtpAddress 'Lynette.Jepson-Mielbrecht@amtrustgroup.com'
Get-Recipient -ResultSize Unlimited -Identity 15811 | Set-Mailbox -EmailAddresses @{Remove='smtp:lynette@amcomins.com'}
#>

<#
Get-Recipient -ResultSize Unlimited -Identity 15811 | Select-Object -ExpandProperty EmailAddresses | Format-List
#>


$oldemail = 'Lynette.Jepson-Mielbrecht@amtrustgroup.com'
$newemail = 'lynette@amcomins.com'
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
