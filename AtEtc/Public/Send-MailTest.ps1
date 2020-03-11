$To = 'User <user@example.com>'
$From = 'User <user@example.com>'
$Subject = 'PSTest'
$SMTPServer = 'appsmtp.example.com'
$logging = "OnSuccess","OnFailure"

Send-MailMessage -body 'test' -to $To -from $From -Subject $Subject -SmtpServer $SMTPServer -DeliveryNotificationOption $logging