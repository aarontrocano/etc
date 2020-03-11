#(edits the necessary reg keys to allow Basic Authentication)
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\' -Name 'AllowBasic' -Value 1
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\' -Name 'AllowUnencryptedTraffic' -Value 1
    
#(set creds)
$credential = Get-Credential
    
#(connect to o365)
Connect-MsolService -Credential $credential
    
#(create powershell session with Exchange Online)
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
    
#(change to remotesigned)
set-executionpolicy remotesigned
    
#(Import the remote session)
Import-PSSession $exchangeSession -DisableNameChecking
    
#reverts the reg keys to allow Basic Authentication)
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\' -Name 'AllowBasic' -Value 0
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\' -Name 'AllowUnencryptedTraffic' -Value 0