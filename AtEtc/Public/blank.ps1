<# $ds = 'red','green','blue','violet'
$ds
$ds.count
Write-Verbose -Message "Hello, World" -Verbose
Write-Verbose -Message $([string]::Format("There are {0} items in the dataset",$ds.count)) -Verbose #>

<# 10d=12o=0Ah.31d=37o=1Fh.14d=16o=0Eh.0d=0o=00h
    12371600o=29f380h=0A1F0E00=169807360d
[byte]      An 8-bit unsigned character
PS C:\> [byte]('0x' + 'FF')
255
#>
Clear-Host

<#---Input---#>
$strIp = $cidr = $bits = $null
$strIp = "255.255.255.0"
$cidr = [int32]24

<#---Compute Mask---#>
$bits = [uint32]([uint32]::MaxValue -shl (32 - $cidr)) <#FYI--[uint32]::MaxValue is '0xFFFFFFFF' '1111 1111 1111 1111'---#>
[Convert]::ToString($bits,2)

<#--Converts IP to Integer, check endianness--#>
$arrByteIp = $intIp = $null
$arrByteIp = [byte[]]$strIp.Split('.')
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$intIp = [System.BitConverter]::ToUInt32($arrByteIp, 0)
Write-Verbose -Message $([string]::Format('Convert IP {0} to Integer {1} in Hex {2:X8}',$strIp,$intIp,$intIp)) -Verbose

<#---Converts Integer to IP, check endianness---#>
$arrByteIp = $strIp = $null
$arrByteIp = [System.BitConverter]::GetBytes($intIp)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strIp = [String]::Join('.',$arrByteIp)
Write-Verbose -Message $([string]::Format('Convert Integer {0} in Hex {1:X8} to IP Address {2}' ,$intIp,$intIp,$strIp)) -Verbose

<#---Address Floor---#>
$floor = [uint32]($intIp -bAnd $bits )

<#---Address Ceiling---#>
$bcast = [uint32]([uint32]::MaxValue -shr (32 - $cidr)) <#FYI--[uint32]::MaxValue is '0xFFFFFFFF' '1111 1111 1111 1111'---#>
[Convert]::ToString($bcast,2)
$bcast
$ceiling = [uint32](($intIp -bAnd $bits ) + ($bcast ) )
<#---Converts Integer to IP, check endianness---#>
$arrByteIp = $strIp = $null
$arrByteIp = [System.BitConverter]::GetBytes($ceiling)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strIp = [String]::Join('.',$arrByteIp)
#Write-Verbose -Message $([string]::Format('Convert Integer {0} in Hex {1:X8} to IP Address {2}' ,$ceiling,$ceiling,$strIp)) -Verbose

function useCrystalBall {
    param (
        [object[]]$clairvoyance
    )
    return $CompleteNetOpsKnowledge
}
function pullRabbitFromHat {
    param (
        [object]$whiteRabbitObject
    )
    return $appstack
}

$localadmin = Get-WmiObject -Class Win32_UserAccount -Filter 'LocalAccount=True And Sid like "%-500"'
([adsi]('WinNT://'+$localadmin.Caption.Replace('\','/'))).SetPassword("mEzfjdX4%MJs")


& 