<#

#>
$Import = $null
$Import = Import-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\file.csv')



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
            if ($dtAccountExpires -lt $(Get-Date).AddDays(90) ) {
                $dtAccountExpiresExtended = $dtAccountExpires.AddDays(90)
                $strAccountExpiresExtended = [string]$dtAccountExpiresExtended.DateTime
                <# Write-Verbose -Message "User: $strName | ExtendedOut: $strAccountExpiresExtended" -Verbose #>
            }
            
        }
        catch {
            Write-Warning -Message "DateTime FromFileTime conversion failed for: $identity" -Verbose
        }
    } else {
        $strAccountExpires = 'Never'
    }

    Write-Verbose -Message "User: $identity | $strName | AccountStatus: $strAccountEnabled | Expires: $strAccountExpires" -Verbose 


}

