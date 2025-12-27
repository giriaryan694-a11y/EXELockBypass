<#
.SYNOPSIS
    EXELockBypass - A PowerShell tool to bypass EXE installation locks in Windows.
.DESCRIPTION
    This script attempts to bypass EXE installation restrictions using the __COMPAT_LAYER=RunAsInvoker technique.
    For educational and authorized testing only.
.NOTES
    Made by Aryan Giri
#>

Write-Host "
EXELockBypass
-------------
Bypass EXE installation locks in Windows
Made by Aryan Giri
"

# Prompt for EXE path
$exePath = Read-Host "Enter the full path of the EXE to bypass (e.g., C:\path\to\setup.exe)"

# Validate input
if (-not (Test-Path $exePath)) {
    Write-Host "[!] Error: File not found at '$exePath'. Check the path and try again." -ForegroundColor Red
    exit 1
}

# Bypass technique
Write-Host "[*] Attempting to bypass EXE lock for: $exePath" -ForegroundColor Cyan
try {
    $env:__COMPAT_LAYER = "RunAsInvoker"
    Start-Process -FilePath $exePath -Wait
    Write-Host "[+] Success! The EXE should now run without restrictions." -ForegroundColor Green
}
catch {
    Write-Host "[!] Error: Failed to bypass. $_" -ForegroundColor Red
}
