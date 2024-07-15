# Browser History Pull Script

# Create and set variables for common history files required 
$chromeHistory = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
$edgeHistory = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"

# create variables for browser zip file
$desktopPath = [Environment]::GetFolderPath('Desktop')
$zipFilePath = Join-Path -Path $desktopPath -ChildPath "BrowserHistoryfiles.zip"

# Create a temporary directory to copy the history files
$tempDir = New-Item -ItemType Directory -Path (Join-Path -Path $env:TEMP -ChildPath "BrowserHistoryTemp")

# Function to copy history file & inform user if the file is not there
function CopyFile {
    param (
        [string]$historyFilePath,
        [string]$browserName
    )
    if (Test-Path -Path $historyFilePath) {
        $destPath = Join-Path -Path $tempDir -ChildPath "$browserName-History"
        Copy-Item -Path $historyFilePath -Destination $destPath -Force
        Write-Host "$browserName copied."
    } else {
        Write-Host "$browserName history not found."
    }
}


# Copy browser history files
Copy-File -historyFilePath $chromeHistory -browserName "Chrome"
Copy-File -historyFilePath $edgeHistory -browserName "Edge"

# Compress the copied history files into a zip file
Compress-Archive -Path $tempDir\* -DestinationPath $zipFilePath -Force