# See https://weblogs.asp.net/soever/returning-an-exit-code-from-a-powershell-script

$global:globalvariable = "Global var"

# Call from PowerShell with: (Command specified in string, execute in own context) 
$command = "./2-to-call.ps1 -name name1"
PowerShell -NonInteractive -NoProfile -Command $command
Write-Host "Exited with exit code " -nonewline
Write-Host "$LastExitCode" -ForegroundColor Green

# Call from PowerShell with: (Direct command, execute in own context) 
PowerShell -NonInteractive -NoProfile -Command { ./2-to-call.ps1 -name name2 } 
Write-Host "Exited with exit code " -nonewline
Write-Host "$LastExitCode" -ForegroundColor Green

# Call from Powershell with: (Command specified in string, invoke in caller context) 
$command = "./2-to-call.ps1 -name name3" 
Invoke-Expression -Command $command
Write-Host "Exited with exit code " -nonewline
Write-Host "$LastExitCode" -ForegroundColor Green

# Call from PowerShell with: (Direct command, execute in caller context)
& ./2-to-call.ps1 -name name4 
Write-Host "Exited with exit code " -nonewline
Write-Host "$LastExitCode" -ForegroundColor Green

pause