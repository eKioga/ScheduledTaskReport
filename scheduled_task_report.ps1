# << Scheduled Task Reporting >> Contact Eric Post if there are any problems. 
# the variables below build out the HTML code for the string at the bottom.
# I find the HTML is easy to edit when it's set up this way.
$a = "<style>"
$a = $a + "BODY{background-color:gainsboro;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:limegreen}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:whitesmoke}"
$a = $a + "</style>"
$Pre = "Status refreshes every five minutes."
$Post = "Now Working? Contact Eric Post for support."
# Replace 'servername' below with the server that is running the scheduled task.
icm servername {Get-ScheduledTaskInfo `
# Replace the "scheduled task name" with the name of the sechduled task you want to track.
-TaskName "Scheduled Task Name"} `
# The script takes the info and pipes it into HTML refrencing the variables above 
| ConvertTo-Html LastRunTime,NextRunTime, `
-title "Azure AD Sync Schedule" `
-body "<H2>Azure AD Sync Schedule</H2>" `
-head $a -PreContent $Pre -PostContent $Post | `
# Then it generates the HTML file and places it in a specific directory.
# Note that in this case, the local server also ran an IIS service.
Set-Content C:\inetpub\wwwroot\azure_sync_status.htm