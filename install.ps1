$pluginsDir = "$env:APPDATA\Vencord\src\plugins"
if (-not (Test-Path $pluginsDir)) {
    Write-Host "Error: Vencord plugins directory not found at $pluginsDir" -ForegroundColor Red
    Write-Host "Please make sure Vencord is installed and you are in a dev environment."
    return
}

try {
    $dest = Join-Path $pluginsDir "clearMyMessages"
    if (Test-Path $dest) {
        Remove-Item -Recurse -Force $dest
    }

    New-Item -ItemType Directory -Force -Path $dest | Out-Null

    $baseUrl = "https://raw.githubusercontent.com/Uncapp3d/CMM/main"

    Write-Host "Downloading ClearMyMessages..." -ForegroundColor Cyan

    Invoke-WebRequest -Uri "$baseUrl/index.tsx" -OutFile (Join-Path $dest "index.tsx") -UseBasicParsing
    Invoke-WebRequest -Uri "$baseUrl/README.md" -OutFile (Join-Path $dest "README.md") -UseBasicParsing
    Invoke-WebRequest -Uri "$baseUrl/LICENSE" -OutFile (Join-Path $dest "LICENSE") -UseBasicParsing

    Write-Host "Installation complete! Please restart Discord." -ForegroundColor Green
} catch {
    Write-Host "An error occurred during installation: $_" -ForegroundColor Red
}
