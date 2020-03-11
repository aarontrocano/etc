<#
.SYNOPSIS
This script finds the timezone offset from current Eastern time and returns an integer to add to current eastern time to reflect the time in another timezone.
.DESCRIPTION
This script is meant to be used in conjunction with the terminations scripts and cmdlets.  Often times when a user is terminated, the account 
will be set to expire the last day at 5PM local time.  This script outputs the hour offset to be added to Eastern Time to adjust for user's 
local time for his or her state.  
.PARAMETER State
This is the two-character state U.S. post office abbreviation
.PARAMETER DateTime
This is a date value, in datetime format
.EXAMPLE
    Import-Module C:\Utilities\ServerScripts\etc\ConvertStateToTimeZone.ps1
    ConvertStateToTimeZone -State TX -Date (get-date)

.NOTES
The first parameter (State) is required.  The second parameter (Date) is required.
#>
function ConvertStateToTimeZone {

    Param( 
        [Parameter(Mandatory = $true )] 
        [string]$State,
        [datetime]$DateTime
    )

    [bool]$boolDaylight = $false
    if ($DateTime.Month -ge 4 -and $DateTime.Month -le 10 ) {
        $boolDaylight = $true
    }

    $Hawaii = 'HI'
    $regexHawaii = @($Hawaii | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Alaska = 'AK'
    $regexAlaska = @($Alaska | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Pacific = 'WA','OR','CA','NV'
    $regexPacific = @($Pacific | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Arizona = 'AZ'
    $regexArizona = @($Arizona | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Mountain = 'MT','ID','WY','UT','CO','NM'
    $regexMountain = @($Mountain | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Central = 'ND','SD','NE','KS','OK','TX','MN','IA','MO','AR','LA','WI','IL','TN','MS','AL'
    $regexCentral = @($Central | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $Eastern = 'MI','IN','OH','KY','NY','PA','VA','NC','SC','GA','FL','ME','VT','NH','MA','RI','CT','NJ','DE','MD','DC'
    $regexEastern = @($Eastern | ForEach-Object {[regex]::Escape($_)}) -join '|'
    $DoesntObserveDST = 'HI','AZ'
    $regexDoesntObserveDST = @($DoesntObserveDST | ForEach-Object {[regex]::Escape($_)}) -join '|'

    switch -regex ($State ) 
    {
        $regexHawaii {[int32]$offset = 5 }
        $regexAlaska {[int32]$offset = 4 }
        $regexPacific {[int32]$offset = 3 }
        $regexArizona {[int32]$offset = 2 }
        $regexMountain {[int32]$offset = 2 }
        $regexCentral {[int32]$offset = 1 }
        $regexEastern {[int32]$offset = 0 }
    }


    if ($boolDaylight -eq $true ) {
        if ($State -match $regexDoesntObserveDST ) {$offset += 1 }
    }

    <#--return--#>
    $offset
}
