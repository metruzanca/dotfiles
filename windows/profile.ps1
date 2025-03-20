# I have no clue what I'm doing FYI
# C:\Users\samue\OneDrive\Documents\WindowsPowerShell/profile.ps1

Invoke-Expression (&starship init powershell)
$ENV:EDITOR = "code"

# Golang installed via webinstall.dev
$UserPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$MachinePath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
$Env:Path = "${UserPath};${MachinePath}"