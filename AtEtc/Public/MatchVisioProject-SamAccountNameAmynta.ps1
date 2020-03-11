$ImportVisio = Import-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\VisioSamAccountName.csv') | Select-Object -ExpandProperty SamAccountName
$ImportProject = Import-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\ProjectSamAccountName.csv') | Select-Object -ExpandProperty SamAccountName
$AmyntaSam = Import-Csv -Path ([Environment]::GetFolderPath("Desktop")+'\SamAccountName.csv') | Select-Object -ExpandProperty samAccountName
$VisioReport = @()
$ProjectReport = @()
$i=0
$j=0
ForEach ($alias in $ImportVisio) {
    if ($AmyntaSam -contains $alias) {
        #Write-host ('match')
        #Write-host ($alias)
        $VisioReport += $alias
        $i++

    } else {
        #Write-Host ('no match')
    }
}
ForEach ($alias in $ImportProject) {
    if ($AmyntaSam -contains $alias) {
        #Write-host ('match')
        #Write-host ($alias)
        $ProjectReport += $alias
        $j++

    } else {
        #Write-Host ('no match')

    }
}
Write-host ('i=' + $i.ToString() +' j=' + $j.ToString() )
$VisioReport | Set-Content -Path  ([Environment]::GetFolderPath("Desktop")+'\VisioReport.txt')
$ProjectReport | Set-Content -Path ([Environment]::GetFolderPath("Desktop")+'\ProjectReport.txt')