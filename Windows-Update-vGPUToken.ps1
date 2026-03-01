# Update-vGPUToken.ps1
param(
    [string]$DlsUrl = "https://10.0.0.220",   # your server IP
    [string]$TokenDir = "C:\Program Files\NVIDIA Corporation\vGPU Licensing\ClientConfigToken"
)

# Ensure token directory exists
if (-not (Test-Path $TokenDir)) {
    New-Item -ItemType Directory -Path $TokenDir -Force | Out-Null
}

# Generate filename with timestamp (same format as working curl command)
$timestamp = Get-Date -Format "dd-MM-yy-HH-mm-ss"
$tokenFile = Join-Path $TokenDir "client_configuration_token_$timestamp.tok"

Write-Host "Downloading token from $DlsUrl using curl..."
try {
    # Use curl.exe with the same parameters that work manually
    & curl.exe --insecure -L -X GET "$DlsUrl/-/client-token" -o "$tokenFile"

    if ($LASTEXITCODE -ne 0) {
        throw "curl exited with code $LASTEXITCODE"
    }
    Write-Host "Token saved to $tokenFile"
}
catch {
    Write-Error "Failed to download token: $_"
    exit 1
}

# Restart NVIDIA service
Write-Host "Restarting NVDisplay.ContainerLocalSystem..."
Restart-Service -Name NVDisplay.ContainerLocalSystem -Force
Write-Host "Service restarted. License status:"
& 'nvidia-smi' -q | Select-String "License"