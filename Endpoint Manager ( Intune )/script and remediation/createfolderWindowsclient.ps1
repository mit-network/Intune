# Define the folder path
$folderPath = "C:\LocalUtilities"

# Check if the folder exists, if not, create it
if (!(Test-Path -Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath
    Write-Host "Folder 'LocalUtilities' created at C:\"
} else {
    Write-Host "Folder 'LocalUtilities' already exists at C:\"
}
