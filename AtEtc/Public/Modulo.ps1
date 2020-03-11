$Import = Import-Csv 'c:\Users\atrocano\Documents\working_Set\Mailboxes.csv'
$Total = $Import.count
$count = 1
foreach ($alias in $Import) {

    
    if (($count % 50) -eq (0)) {Write-Host ('Working on ' + $count + ' of ' + $Total + ' mailboxes.')} elseif (($count) -lt (4)) {Write-Host ('Working on ' + $count + ' of ' + $Total + ' mailboxes.')}
    $count++
}
