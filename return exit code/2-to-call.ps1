param (
    [string]$name = $( Read-Host "Input string")
 )

Write-Host $name -ForegroundColor Yellow

function ExitWithCode {
    param (
        $exitcode 
    )

    $Host.SetShouldExit($exitcode) 
    exit $exitcode
}

Write-Host "Global var: " -nonewline
Write-Host "$globalvariable" -ForegroundColor Blue

$Host.SetShouldExit(456)    # To get a result other than 0/1 when used with PowerShell command
exit 456                    # To get a result with Invoke-Expression or Direc command

# It is also possible to use a function to replace the previous 2 lines
#ExitWithCode -exitcode 456

Write-Host "SHOULD NOT APPEAR" -ForegroundColor Red 
