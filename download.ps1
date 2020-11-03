[Microsoft.Office.Interop.Outlook.Application] $outlook = New-Object -ComObject Outlook.Application
$entries = $outlook.Session.GetGlobalAddressList().AddressEntries
foreach($entry in $entries){
    write-output ("{0}: {1}" -f $entry.Name, $entry.GetExchangeUser().FirstName)
}