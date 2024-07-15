# Browser History Pull Script

# Create and set variables for common history files required 
$chromeHistory = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
$edgeHistory = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"

# create variables for browser zip file
$desktopPath = [Environment]::GetFolderPath('Desktop')
$zipFilePath = Join-Path -Path $desktopPath -ChildPath "BrowserHistoryfiles.zip"

# Create a temporary directory to copy the history files
$tempDir = New-Item -ItemType Directory -Path (Join-Path -Path $env:TEMP -ChildPath "BrowserHistoryTemp")