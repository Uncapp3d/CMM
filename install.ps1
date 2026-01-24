$pluginsDir = "$env:APPDATA\Vencord\src\plugins"
if (-not (Test-Path $pluginsDir)) {
    $pluginsDir = "$env:LOCALAPPDATA\Vencord\src\plugins"
}

if (-not (Test-Path $pluginsDir)) {
    Write-Host "Error: Vencord plugins directory not found." -ForegroundColor Red
    Write-Host "Tried: $env:APPDATA\Vencord\src\plugins"
    Write-Host "Tried: $env:LOCALAPPDATA\Vencord\src\plugins"
    Write-Host "`nPlease install Vencord Dev first or set it up manually."
    Read-Host "`nPress Enter to close"
    return
}

try {
    $dest = Join-Path $pluginsDir "clearMyMessages"
    Write-Host "Setting up folder at $dest..." -ForegroundColor Gray
    
    if (Test-Path $dest) {
        Remove-Item -Recurse -Force $dest
    }
    New-Item -ItemType Directory -Force -Path $dest | Out-Null

    $baseUrl = "https://raw.githubusercontent.com/Uncapp3d/CMM/main"
    Write-Host "Downloading ClearMyMessages..." -ForegroundColor Cyan

    Invoke-WebRequest -Uri "$baseUrl/index.tsx" -OutFile (Join-Path $dest "index.tsx") -UseBasicParsing
    Invoke-WebRequest -Uri "$baseUrl/README.md" -OutFile (Join-Path $dest "README.md") -UseBasicParsing
    Invoke-WebRequest -Uri "$baseUrl/LICENSE" -OutFile (Join-Path $dest "LICENSE") -UseBasicParsing

    Write-Host "`nSuccessfully installed to $dest" -ForegroundColor Green
    Write-Host "Please restart Discord / Rebuild Vencord." -ForegroundColor Green
    Read-Host "`nPress Enter to finish"
} catch {
    Write-Host "`nAn error occurred: $_" -ForegroundColor Red
    Read-Host "Press Enter to close"
}
