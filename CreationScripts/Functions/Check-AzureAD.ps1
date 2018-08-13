#If the try line is unsuccesful, open a window to the Connect-AzureID with my admin email

$adminemail = "Thisismyemail@account.com"

Clear-Host
$error.clear()
#insert OID of random
try { get-azureaduser -ObjectId $adminemail }
catch { 
#change tenantID to your actual tenant ID.
    Connect-AzureAD -AzureEnvironmentName AzureCloud -TenantId ac23123-60b3-2312-bd9d-12312412 -AccountId $adminemail
}
if (!$error) {
    "No Error Occured"
}
else {"Azure is good to go"}
