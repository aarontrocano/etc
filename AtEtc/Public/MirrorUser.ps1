$regex_g_srcToMirror = '' 
$g_srcToMirror = @()
$g_srcToMirror = $($regex_g_srcToMirror -replace '\\(.)','$1' ).split('|')
$Import = $g_srcToMirror
$Export = ([Environment]::GetFolderPath("Desktop")+'\groups ' + (Get-Date -format MM-dd-yyyy-HH-mm-ss) + '.txt')
$Report = @()
foreach ($g in $Import ) {
    $objGroup = $(Get-ADGroup -Identity $g -Properties SamAccountName )
    $Report += $objGroup
}
$Report | Sort-Object -Property $SamAccountName | Select-Object -ExpandProperty SamAccountName | Set-Content -Path $Export
$MGarrisonGroups = $Report | Sort-Object -Property $SamAccountName | Select-Object -ExpandProperty SamAccountName
$g_srcToMirror = $MGarrisonGroups

$Import = Get-Content ([Environment]::GetFolderPath("Desktop")+'\groups 08-08-2019-20-17-20.txt')
$g_srcToMirror = $Import

#$g_srcToMirror = (get-aduser -filter {displayname -like 'Alice Jones' } | get-adprincipalgroupmembership -server dc01 | Sort-Object -property SamAccountName).SamAccountName  
$g_destOfMirror = (get-aduser -filter {displayname -like 'Bob Smith' } | get-adprincipalgroupmembership -server dc01 | Sort-Object -property SamAccountName).SamAccountName 
$regex_g_destOfMirror = @($g_destOfMirror | ForEach-Object {[regex]::Escape($_)}) -join '|'
$g_srcToMirror_CleanPass01 = @($g_srcToMirror | Where-Object {$_ -notmatch $regex_g_destOfMirror }) 


$sAmName = 'Cgarcia1' #Christy Garcia
$Errorlog = ([Environment]::GetFolderPath("Desktop")+'\error ' + (Get-Date -format MM-dd-yyyy-HH-mm-ss) + '.txt')


foreach ($groupSam in $g_srcToMirror_CleanPass01) {
    try {
        Add-ADGroupMember <#-WhatIf#> -Identity $groupSam -Members $sAmName -ErrorAction Stop
    }
    catch {
        Write-Verbose -message "Error adding user $($sAmName) to group $($groupSam)." -Verbose
        Add-Content -Path $Errorlog -Value ("Error adding user $($sAmName) to group $($groupSam). " + (Get-Date -format MM-dd-yyyy-HH-mm-ss) )
    }
    
}