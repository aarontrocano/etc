$paths = import-csv ([Environment]::GetFolderPath("Desktop") + '\path.csv')
$robocopylog = ([Environment]::GetFolderPath("Desktop") + '\Robocopylogs ' + (get-date -format MM-dd-yyyy) + '.log')
$PSErrorLog = ([Environment]::GetFolderPath("Desktop") + '\PSErrorLog ' + (get-date -format MM-dd-yyyy) + '.txt')
$options = @("/e", "/xj", "/r:2", "/w:5", "/v", "/MT:16", "/purge", "/B", "/it", "/copyall", "/log+:$robocopylog")
$sourcetime = [string](get-date).AddDays(-30)
$destinationtime = [string](get-date).AddDays(-30)
foreach ($path in $paths) {
    $ErrorActionPreference = "stop"
    Try {
        $source = [string]$path.source
        $destination = [string]$path.destination
        $extension = ('.bak', '.txt')
        [array]$backupinfo = get-childitem $source | where-object { $_.creationtime -gt $sourcetime -and $extension -contains $_.Extension } 
        $backupcount = $backupinfo | measure-object
        if ($backupcount -ne 0) { 
            foreach ($backup in $backupinfo) {     
                $sourcefile = [string]$source + '\' + $backup.Name
                $destinationfile = [string]$destination + '\' + $backup.name
                [array]$destbackinfo = get-childitem $destinationfile { $_.creationtime -gt $destinationtime -and $extension -contains $_.Extension } -ErrorAction SilentlyContinue            
                if ($destbackinfo.count -ne 0) {
                    foreach ($destback in $destbackinfo) {
                        $cmdargs = @($source, $destination, $destback.name, $options)
                        write-verbose "Copying '$sourcefile' to destination directory!" -verbose
                        robocopy @cmdargs | out-null                      
                    }
                }               
                if ($destbackinfo.count -eq 0) {                            
                    $cmdargs = @($source, $destination, $backup.name, $options)
                    write-verbose "Copying '$sourcefile' to destination directory!" -verbose
                    robocopy @cmdargs | out-null                
                }                                       
            }
        }
    }
    catch {
        Write-Warning $_.Exception.message
        Add-Content -Path $PSerrorlog -Value $_.Exception.message 
    }
}






$CPSCredential = Get-Credential
$s = 'cardcpssrvdbs03.amyntagroup.com'
$FarSide = Invoke-Command -ComputerName $s -ScriptBlock {$PSVersionTable.PSVersion.ToString() } -credential $CPSCredential 
$FarSide
Write-Host ('Done !')