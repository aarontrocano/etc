<#
    This is the basic test logic I will use to see if username matches Cleveland Amynta 
    user for my drive mapping report. 
    I will get a list of SAMIds to load into an array to test each user if it contains
    him or her.   
#>
$ToMatch = @('Aaron Aaronson','Bob Bobert','Chris Christie')
$Import = Get-Content -Path ([Environment]::GetFolderPath("Desktop")+'\mailboxes.txt')
$report = @()
$errorlog = @()
$test = $null
foreach ($alias in $Import) {
    $test = $alias | Where-Object { $ToMatch -contains $_}
    if ($test) {Write-Host ($alias + ': Test Result: ' + $test)} else {Write-Host ($alias + ': Test Result: FALSE')}
    $test = $null
}