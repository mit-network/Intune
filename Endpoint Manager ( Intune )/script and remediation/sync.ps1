# Define the source folder path on the server
$sourcePath = "\\192.68.2.201\share"  # Replace with your server's actual path

# Define the destination folder on the client
$destinationPath = "C:\LocalUtilities"

# Define the credentials (replace with your actual username and password)
$Username = "administrator"  # Replace with the username
$Password = "P@ssword103"  # Replace with the password
$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential($Username, $SecurePassword)

# Create the destination folder if it doesn't exist
if (-Not (Test-Path -Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath
}

# Sync the applications using robocopy (includes subdirectories and newer files)
robocopy $sourcePath $destinationPath /MIR /Z /R:5 /W:10

# /MIR = Mirror directories (new, changed, deleted files)
# /Z   = Restartable mode (useful for unstable network connections)
# /R:5 = Retry 5 times on failed copies
# /W:10 = Wait 10 seconds between retries

# Check if robocopy was successful
if ($LASTEXITCODE -le 8) {
    Write-Output "Application sync completed successfully."
} else {
    Write-Output "Application sync encountered errors. Exit code: $LASTEXITCODE"
}

