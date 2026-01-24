$pluginsDir = "$env:APPDATA\Vencord\src\plugins"
if (-not (Test-Path $pluginsDir)) {
    Write-Error "Vencord plugins directory not found at $pluginsDir"
    exit
}

$dest = Join-Path $pluginsDir "clearMyMessages"
if (Test-Path $dest) {
    Remove-Item -Recurse -Force $dest
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null

$baseUrl = "https://raw.githubusercontent.com/uncapp3d/ClearMyMessages/main"

Write-Host "Downloading ClearMyMessages..." -ForegroundColor Cyan

Invoke-WebRequest -Uri "$baseUrl/index.tsx" -OutFile (Join-Path $dest "index.tsx")
Invoke-WebRequest -Uri "$baseUrl/README.md" -OutFile (Join-Path $dest "README.md")
Invoke-WebRequest -Uri "$baseUrl/LICENSE" -OutFile (Join-Path $dest "LICENSE")

Write-Host "Installation complete! Please restart Discord." -ForegroundColor Green
