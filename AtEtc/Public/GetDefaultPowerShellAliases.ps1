<#
Get default powershell aliases % ? 
#>
[Management.Automation.Runspaces.InitialSessionState].getproperty(
        "BuiltInAliases", [reflection.bindingflags]"NonPublic,Static").getvalue(
             $null, @()) | format-table -auto