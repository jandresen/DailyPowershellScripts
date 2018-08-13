#region mobilenumber
#Grabs input from Microsoft Form and formats it to an 11 string.
#There's probrably a better way of doing this.

if (($MobileNumber -eq "Do we need to order a phone and cell number?") -or ($MobileNumber -eq "Yes, employee will need a new phone and new cell number." )) {
    $MobileNumber = ""
}
else {
    $MobileNumberfixed = $MobileNumber -replace "[^0-9]"
    if (($MobileNumberfixed.Length) -eq 11) {
        $MobileNumberfixed = $MobileNumberfixed.Substring(1)
        $MobileNumber = $MobileNumberfixed
    }
    else {
        $MobileNumber = $MobileNumberfixed
    }
}
if ($MobileNumber -match ".*\d+.*") {
    "This is what I got for MobileNumber - $MobileNumber"
}
else {
    "Number doesnt have any numbers in it"
    $MobileNumber = $null
}
#endregion
