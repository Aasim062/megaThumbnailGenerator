# Define the download folder
$DownloadFolder = "download_folder"#folder name where the downloaded file of mega is stored

# Run indefinitely to monitor the folder
while ($true) {
    # Check if the folder exists
    if (!(Test-Path $DownloadFolder)) {
        Write-Host "Error: Download folder not found."
        exit
    }

    # Identify the most recently downloaded file
    $DownloadedFile = Get-ChildItem -Path $DownloadFolder | Sort-Object LastWriteTime -Descending | Select-Object -First 1

    if ($DownloadedFile) {
        # Delete the file from local storage
        Remove-Item -Path "$DownloadFolder\$($DownloadedFile.Name)" -Force
        Write-Host "Deleted from local storage: $($DownloadedFile.Name)"
    } else {
        Write-Host "No file found for deletion. Waiting for new files..."
    }

    # Wait for 5 seconds before checking again
    Start-Sleep -Seconds 5
}
