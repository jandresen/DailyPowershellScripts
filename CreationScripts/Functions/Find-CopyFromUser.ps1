#region Find CopyFromUser
if ($CopyFromUser -like "*@*") { #If the input has an @ sign in it, its probrably an email.
    $CopyFromUser = get-aduser -Filter {Mail -like $CopyFromUser}
}
else {
    if ($CopyFromUser -like "* *") { #If the input has a space in it,its probrably a name.
        $CopyFromUser = get-aduser -Filter {Name -like $CopyFromUser}
    }
    else {
        if ($CopyFromUser -ne $null) { #if it doesnt have an at sign or a space in it, it may be a first name.
            $copyfromusermaybe = get-aduser -Filter {Givenname -like $CopyFromUser} #search for the people it might be
            if (($copyfromusermaybe).Count -ge 1) { #if it returns more than 1 person, give me a selection window.
                $SelectionMade = $copyfromusermaybe | Out-GridView -Title 'Select $CopyFromUser to use' -passthru 
                $CopyFromUser = $SelectionMade 
            }
            else {$CopyFromUser = $copyfromusermaybe}
        }
        else {
            "CopyFromField was empty."
            $CopyFromUser = Read-Host "Write the name of  the user we need to copy from"
            $CopyFromUser = get-aduser -Filter {Name -like $CopyFromUser}
        }
    }
}
$CopyFromUserManager = get-aduser $CopyFromUser -Properties Manager | Select-Object -ExpandProperty Manager
Write-host -ForegroundColor Cyan "---- Copy from user is $CopyFromUser ----"
