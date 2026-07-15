$ErrorActionPreference = "Stop"

$sourceRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$petConfig = Join-Path $sourceRoot "pet.json"
$spritesheet = Join-Path $sourceRoot "spritesheet.webp"
$target = Join-Path $HOME ".codex\pets\homelander-chibi"

if (-not (Test-Path -LiteralPath $petConfig)) {
    throw "Missing pet.json in $sourceRoot"
}

if (-not (Test-Path -LiteralPath $spritesheet)) {
    throw "Missing spritesheet.webp in $sourceRoot"
}

New-Item -ItemType Directory -Path $target -Force | Out-Null
Copy-Item -LiteralPath $petConfig -Destination (Join-Path $target "pet.json") -Force
Copy-Item -LiteralPath $spritesheet -Destination (Join-Path $target "spritesheet.webp") -Force

Write-Host "Installed 小祖国人 to $target"
Write-Host "Restart Codex and select 小祖国人 from the pet list."
