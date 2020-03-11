$str = (get-date).toString()
$str | Tee-Object -FilePath ([Environment]::GetFolderPath("Desktop") + '\teetest.txt') -Append