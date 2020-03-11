$u = Get-ADUser -Identity atrocano -Properties accountExpires
$u
$u.accountExpires
$u.Enabled
$u.Enabled.GetType()
$([DateTime]::FromFileTime($u.accountExpires)).DateTime
$($([DateTime]::FromFileTime($u.accountExpires)).AddDays(90)).DateTime
$a = (Get-Date)
#$a | Get-Member