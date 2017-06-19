$a = "<style>"
$a = $a + "BODY{background-color:gainsboro;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:limegreen}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:whitesmoke}"
$a = $a + "</style>"
$Pre = "Status refreshes every five minutes."
$Post = "Now Working? Contact Eric Post for support."
icm servername {Get-ScheduledTaskInfo -TaskName "Azure AD Sync Scheduler"} | ConvertTo-Html LastRunTime,NextRunTime, -title "Azure AD Sync Schedule" -body "<H2>Azure AD Sync Schedule</H2>" -head $a -PreContent $Pre -PostContent $Post | Set-Content C:\inetpub\wwwroot\azure_sync_status.htm