# Get all files and folders recursively from MEGA
$files = mega-find /

# Define the output file path
$outputFile = "$PSScriptRoot\mega_file_list.txt"

# Save the file list to a txt file
$files | Out-File -Encoding utf8 $outputFile

Write-Host "File list saved to: $outputFile"
