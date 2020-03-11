$To = 'Aaron Trocano <aaron.trocano@amtrustgroup.com>'
$From = 'Aaron Trocano <aaron.trocano@amtrustgroup.com>'
$Subject = 'PSTest'
$SMTPServer = 'appsmtp.amtrustservices.com'
$logging = "OnSuccess","OnFailure"

Send-MailMessage -body 'test' -to $To -from $From -Subject $Subject -SmtpServer $SMTPServer -DeliveryNotificationOption $logging