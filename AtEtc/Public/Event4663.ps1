<# $server = "RootMS01", "RootDC01" #>
$server = @()
$server = "host.example.com"
$out = New-Object System.Text.StringBuilder 
$out.AppendLine("ServerName,EventID,TimeCreated,UserName,File_or_Folder,AccessMask")
$ns = @{e = "http://schemas.microsoft.com/win/2004/08/events/event"} 
ForEach ($svr in $server) 
{    $evts = Get-WinEvent -computer $svr -FilterHashtable @{logname = "security"; id = "4663"} -oldest

    ForEach ($evt in $evts) { 
        [xml]$xml = $evt.ToXml()

        $SubjectUserName = Select-Xml -Xml $xml -Namespace $ns -XPath "//e:Data[@Name='SubjectUserName']/text()" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty Value

        $ObjectName = Select-Xml -Xml $xml -Namespace $ns -XPath "//e:Data[@Name='ObjectName']/text()" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty Value

        $AccessMask = Select-Xml -Xml $xml -Namespace $ns -XPath "//e:Data[@Name='AccessMask']/text()" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty Value

        $out.AppendLine("$($svr),$($evt.id),$($evt.TimeCreated),$SubjectUserName,$ObjectName,$AccessMask")

        Write-Host $svr 
        Write-Host $evt.id, $evt.TimeCreated, $SubjectUserName, $ObjectName, $AccessMask

    } 
} 
$out.ToString() | out-file -filepath ([Environment]::GetFolderPath("Desktop")+'\Event4663.csv')