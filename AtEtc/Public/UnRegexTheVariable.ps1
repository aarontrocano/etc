<#
    Unregex the variable / Un regex the variable

    The about_Regular_Expressions help file is a decent place to start. 
    Also helpful http://www.regular-expressions.info/ 
#>
$regexGroups = ''
$arrGroups = @()
$arrGroups = $($regexGroups -replace '\\(.)','$1' ).split('|') <#--In a regular expression, anything in parentheses (with no other modifiers, such as "(.)") is a capturing group.  This can be referred to later in a Replace operation by a dollar sign followed by the index of the capturing group (1 being the first set of parentheses in the list, etc). So the pattern I posted replaces a backslash character followed by any single character, with just that second character.--#>
$arrGroups | Format-Table


$regexGroups = ''
$arrGroups = @()
$arrGroups = $($regexGroups -replace '\\(.)','$1' ).split('|') 
$arrGroups | Format-Table

