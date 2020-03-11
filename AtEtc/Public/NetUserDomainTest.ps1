$a = Get-ADUser -Identity 21641 -Properties SamAccountName,Name,Description,EmployeeID,
                Enabled,LastBadPasswordAttempt,LastLogonDate,LockedOut,PasswordExpired,
                PasswordLastSet,AccountExpires,PasswordNeverExpires,PasswordNotRequired
if ($a.Enabled -eq $true) {$AccountActive='Yes'} else {$AccountActive='No'}
$a | Select-Object SamAccountName,Name,Description,EmployeeID,
                Enabled,LastBadPasswordAttempt,LastLogonDate,LockedOut,PasswordExpired,
                PasswordLastSet,AccountExpires,PasswordNeverExpires,PasswordNotRequired
$a.Enabled
#need global groups
