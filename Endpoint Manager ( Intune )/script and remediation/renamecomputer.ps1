# Get the computer's serial number
$serialNumber = (Get-WmiObject -Class Win32_BIOS).SerialNumber

# Construct the new computer name
$newComputerName = "PC-" + $serialNumber

# Check if the computer name needs to be changed
if ($env:COMPUTERNAME -ne $newComputerName) {
    # Rename the computer and restart
    Rename-Computer -NewName $newComputerName -Force -Restart
}
