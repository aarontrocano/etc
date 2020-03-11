<#---Converts Integer to IP, check endianness---#>
$arrByteIp = $strIp = $null
$arrByteIp = [System.BitConverter]::GetBytes($intIp)
if ([System.BitConverter]::IsLittleEndian ) {
    [array]::Reverse($arrByteIp)
}
$strIp = [String]::Join('.',$arrByteIp)