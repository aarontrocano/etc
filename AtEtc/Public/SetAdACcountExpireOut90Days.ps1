<#

#>
$Import = $null
$Import = Import-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\GMAccounts.csv')



foreach ($usr in $Import) {

    $identity = $usr.samaccountname
    $objUser = Get-ADUser -Identity $identity -Properties accountExpires,Name
    $strName = [string]$objUser.Name
    $strAccountEnabled = If ($objUser.Enabled ) {'Enabled'} else {'Disabled'}
    <# $objUser #>

    if ($objUser.accountExpires -ne [Long]::MaxValue ) {
        try {
            $dtAccountExpires = [DateTime]::FromFileTime($objUser.accountExpires)
            $strAccountExpires = [string]$dtAccountExpires.DateTime
        }
        catch {
            Write-Warning -Message "DateTime FromFileTime conversion failed for: $identity" -Verbose
        }
        try {
            if ($dtAccountExpires -lt $(Get-Date).AddDays(90) ) {
                $dtAccountExpiresExtended = $dtAccountExpires.AddDays(90)
                $strAccountExpiresExtended = [string]$dtAccountExpiresExtended.DateTime

                Set-ADAccountExpiration -Identity $Identity -DateTime $dtAccountExpiresExtended

                Write-Verbose -Message "User: $strName | ExtendedOut: $strAccountExpiresExtended" -Verbose
            }
        }
        catch {
            Write-Warning -Message "Set ADAccountEXpiration failed for: $identity" -Verbose
        }
    } else {
        $strAccountExpires = 'Never'
    }

    <# Write-Verbose -Message "User: $identity | $strName | AccountStatus: $strAccountEnabled | Expires: $strAccountExpires" -Verbose  #>


}

