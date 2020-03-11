#Registry Path
$registrypath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client'
#Entry1
$Name1 = "AllowBasic"
#Entry2
$Name2 = "AllowUnencryptedTraffic"
#Value
$Value = "1"
try {
    #Get Registry Path
    $winrmquery = get-itemproperty -path "$registrypath"
    #Test Registry Path
    $test = test-path "$registrypath"
    #If test works, look for Value 0 for both entries
    if ($test -eq $true -and $winrmquery.AllowBasic -eq 0 -and $winrmquery.AllowUnencryptedTraffic -eq 0) {
        #set regsitry value to 1 to Allow Basic Autentication
        Set-Itemproperty -path "$registrypath" -Name $Name1 -value $Value 
        #set regustry value to 1 to Allow Unencrypted Traffic
        Set-Itemproperty -path "$registrypath" -Name $Name2 -value $Value 
    }
    #Catch Conditions
    else { write-verbose "Missing $winrmquery key or Values Not Equal to 0!" }
    #Re-check the path after it's changed
    $Check = get-itemproperty -path "$registrypath"
    #Write Change to screen with Variable
    $Check
    #Create Condition to connect to O365 if Registry settings reflect the change
    if ($check.allowbasic -eq 1 -and $check.allowunencryptedtraffic -eq 1) {
        #Import MSonline Module
        Import-module MSOnline
        #Use Get Credentials or pass profile credential variable to connection
        Connect-MsolService -Credential $cred
        #O365 URI
        $msoExchangeURL = "https://outlook.office365.com/powershell-liveid/"
        #Base Session
        $session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $msoExchangeURL -Credential $cred -Authentication Basic -AllowRedirection 
        #Use O365 prefix to prevent Clobbering with local Exchange Commands
        Import-PSSession $session -Prefix O365
    }
}
catch { }