[CmdletBinding()]
param(
    [string]$OutputDirectory = (Join-Path $PSScriptRoot 'release')
)

$ErrorActionPreference = 'Stop'

$manifest = Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot 'manifest.json') | ConvertFrom-Json
if ($manifest.manifest_version -ne 3 -or [string]::IsNullOrWhiteSpace($manifest.version)) {
    throw 'manifest.json must be a valid Manifest V3 file with a version number.'
}

$packageName = "stock-helper-$($manifest.version).zip"
$outputPath = Join-Path $OutputDirectory $packageName
$packageItems = @(
    'manifest.json',
    'popup.html',
    'main.css',
    'main.js',
    'images'
) | ForEach-Object { Join-Path $PSScriptRoot $_ }

New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
Compress-Archive -Path $packageItems -DestinationPath $outputPath -Force

Write-Host "Created Chrome Web Store package: $outputPath"
