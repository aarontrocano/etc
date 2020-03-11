<# $server = "RootMS01", "RootDC01" #>
$server = @()
$server = "host.example.com"
$out = New-Object System.Text.StringBuilder 
$out.AppendLine("ServerName,EventID,TimeCreated,UserName,IpAddress,Hostname")
$ns = @{e = "http://schemas.microsoft.com/win/2004/08/events/event"} 
ForEach ($svr in $server) 
{    $evts = Get-WinEvent -computer $svr -FilterHashtable @{logname = "security"; id = "5140"} -oldest

    ForEach ($evt in $evts) { 
        [xml]$xml = $evt.ToXml()

        $SubjectUserName = Select-Xml -Xml $xml -Namespace $ns -XPath "//e:Data[@Name='SubjectUserName']/text()" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty Value

        $IpAddress = Select-Xml -Xml $xml -Namespace $ns -XPath "//e:Data[@Name='IpAddress']/text()" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty Value
        
        $Hostname = ([system.net.dns]::GetHostByAddress($IpAddress)).hostname

        $out.AppendLine("$($svr),$($evt.id),$($evt.TimeCreated),$SubjectUserName,$IpAddress,$Hostname")

        Write-Host $svr 
        Write-Host $evt.id, $evt.TimeCreated, $SubjectUserName, $IpAddress, $Hostname

    } 
} 
$out.ToString() | out-file -filepath ([Environment]::GetFolderPath("Desktop")+'\Event5140.csv')