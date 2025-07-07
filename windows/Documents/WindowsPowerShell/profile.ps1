# I have no clue what I'm doing FYI
# Depending on if OneDrive was setup at install time, profile will be in one of these locations:
# C:\Users\samue\Documents\WindowsPowerShell/profile.ps1
# C:\Users\samue\OneDrive\Documents\WindowsPowerShell/profile.ps1

Invoke-Expression (&starship init powershell)
$ENV:EDITOR = "code"

# Golang installed via webinstall.dev
$UserPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$MachinePath = [Environment]::GetEnvironmentVariable('Path', 'Machine')
$Env:Path = "${UserPath};${MachinePath}"