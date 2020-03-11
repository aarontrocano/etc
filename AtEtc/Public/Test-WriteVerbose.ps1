$VerbosePreference = "Continue" <#Continue|SilentlyContinue#>
for ($i=0; $i -lt 10; $i++) {
    Write-Verbose -Message "Counting. $i"
}
$VerbosePreference = "SilentlyContinue"