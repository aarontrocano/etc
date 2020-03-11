<#shorthand: Get-Module -ListAvailable | Import-Module ; gcm -co cmdlet | measure#>
Get-Module -ListAvailable | Import-Module 
Get-Command -CommandType Cmdlet | Measure-Object