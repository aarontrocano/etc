<#

#>
$alias = 'user'
$MyInvocation.InvocationName
$var = ((Split-Path $MyInvocation.InvocationName)+'\')
$var
$Groups = @()
$Groups = Invoke-Expression "& ((Split-Path $MyInvocation.InvocationName)+'..\AD\Get-GroupsExpansion-FromSamAccount.ps1') $alias"
$Groups