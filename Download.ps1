
# Define file paths
$MegaLinksFile = "enter the text file name you want to download"
$DownloadFolder = "download_folder"#this is the folder name in which the file is stored

# Create the download folder if it doesn't exist
if (!(Test-Path $DownloadFolder)) {
    New-Item -ItemType Directory -Path $DownloadFolder | Out-Null
}

# Check if the links file exists
if (!(Test-Path $MegaLinksFile)) {
    Write-Host "Error: File mega_links.txt not found."
    exit
}

# Read MEGA links from the text file
$Links = Get-Content $MegaLinksFile

foreach ($Link in $Links) {
    $Link = $Link.Trim()
    if ($Link -ne "") {
        try {
            Write-Host "Downloading: $Link"
            mega-get $Link $DownloadFolder
            Write-Host "Download completed: $Link"

            # Move the downloaded file to the deletion queue (optional)
            Start-Process -FilePath "powershell.exe" -ArgumentList "-File mega_delete.ps1"

            # Remove the processed link from the file
            $RemainingLinks = $Links | Where-Object { $_ -ne $Link }
            $RemainingLinks | Set-Content $MegaLinksFile
        }
        catch {
            Write-Host "Error downloading: $Link"
        }
    }
}# Define file paths
$MegaLinksFile = "test.txt"
$DownloadFolder = "download_folder"

# Create the download folder if it doesn't exist
if (!(Test-Path $DownloadFolder)) {
    New-Item -ItemType Directory -Path $DownloadFolder | Out-Null
}

# Check if the links file exists
if (!(Test-Path $MegaLinksFile)) {
    Write-Host "Error: File mega_links.txt not found."
    exit
}

# Read MEGA links from the text file
$Links = Get-Content $MegaLinksFile

foreach ($Link in $Links) {
    $Link = $Link.Trim()
    if ($Link -ne "") {
        try {
            Write-Host "Downloading: $Link"
            mega-get $Link $DownloadFolder
            Write-Host "Download completed: $Link"

            # Move the downloaded file to the deletion queue (optional)
            Start-Process -FilePath "powershell.exe" -ArgumentList "-File mega_delete.ps1"

            # Remove the processed link from the file
            $RemainingLinks = $Links | Where-Object { $_ -ne $Link }
            $RemainingLinks | Set-Content $MegaLinksFile
        }
        catch {
            Write-Host "Error downloading: $Link"
        }
    }
}
