<#

https://stackoverflow.com/questions/7586041/how-to-get-the-ip-range-out-of-a-cidr-notation-or-an-address-netmask-pair-using
#>
#$network = [Uint32]0x0a427200 <# 10.66.114.0 #>
$network = [Uint32]0x0A1F0E00 <# 10.31.14.0 #>
$subnet_length = [Uint32]23

$mask = [uint32]([uint32]::MaxValue -shl [Uint32]([Uint32]32 - $subnet_length))
#$bcast = [uint32]([uint32]::MaxValue -shr [Uint32]([Uint32]32 - $subnet_length))
$wildcard = -bNot $mask
[Convert]::ToString($mask,2)
#[Convert]::ToString($bcast,2)
[Convert]::ToString($wildcard,2)
$mask
#$bcast
$wildcard

$start_ip = ($network -bAnd $mask) + 1
$end_ip = ($network -bAnd $mask) + ($wildcard - 1)
$start_ip
$end_ip

<#---Converts Integer to IP, check endianness---#>
$arrByteIp = $strNetwork = $null
$arrByteIp = [System.BitConverter]::GetBytes($network)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strNetwork = [String]::Join('.',$arrByteIp)
$arrByteIp = $strStart_ip = $null
$arrByteIp = [System.BitConverter]::GetBytes($start_ip)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strStart_ip = [String]::Join('.',$arrByteIp)
$arrByteIp = $strEnd_ip = $null
$arrByteIp = [System.BitConverter]::GetBytes($end_ip)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strEnd_ip = [String]::Join('.',$arrByteIp)
Write-Verbose -Message $([string]::Format('Convert Start_IP Integer {0} in Hex {1:X8} to IP Address {2}' ,$start_ip,$start_ip,$strStart_ip)) -Verbose
Write-Verbose -Message $([string]::Format('Convert End_IP   Integer {0} in Hex {1:X8} to IP Address {2}' ,$end_ip,$end_ip,$strEnd_ip)) -Verbose