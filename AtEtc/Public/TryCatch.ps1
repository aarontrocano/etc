
<#--So, it throws an exception--#>
        $da.Fill($ds)
<#
    Read the Exception
#>
        $Error[0].exception.Message
<#
    Retrieve Name of the exception, to catch it.
#>
        $Error[0].exception.GetType().FullName
        --> System.Management.Automation.MethodInvocationException

        try {
            $da.Fill($ds)
            [bool]$boolSqlRights = $true
        }
        catch [System.Management.Automation.MethodInvocationException] {
            Write-Warning -Message "Insufficient SQL Permission to query/execute, run from another login account." 
            [bool]$boolSqlRights = $false
        }
        catch {
            Write-Warning -Message "General error, run from another login account." 
            [bool]$boolSqlRights = $false
        }