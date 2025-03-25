[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$Path = ".",
    [Parameter(Mandatory=$false)]
    [switch]$Recursive = $true,
    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeDirs = @(".git", ".vscode", ".cursor", ".cwtools", "docs", "logs")
)

# Validate if the path exists
if (-not (Test-Path -Path $Path)) {
    Write-Error "The specified path '$Path' does not exist."
    exit 1
}

Write-Host "Searching for files to convert to UTF-8 with BOM..." -ForegroundColor Cyan

# Define function to check if path should be skipped
function ShouldSkipPath {
    param($CheckPath)
    
    foreach ($exclude in $ExcludeDirs) {
        if ($CheckPath -like "*\$exclude\*" -or $CheckPath -like "*\$exclude") {
            return $true
        }
    }
    return $false
}

# Find all relevant files
$filesToConvert = @()
if ($Recursive) {
    Get-ChildItem -Path $Path -Recurse -Include *.yml,*.txt,*.gui,*.gfx | ForEach-Object {
        if (-not (ShouldSkipPath $_.FullName)) {
            $filesToConvert += $_
        }
    }
} else {
    $filesToConvert = Get-ChildItem -Path $Path -Include *.yml,*.txt,*.gui,*.gfx
}

if ($filesToConvert.Count -eq 0) {
    Write-Warning "No files found to convert."
    exit 0
}

Write-Host "Found $($filesToConvert.Count) files to convert." -ForegroundColor Green

$convertedCount = 0
foreach ($file in $filesToConvert) {
    # Skip binary files or files that are too large
    if ($file.Length -gt 5MB) {
        Write-Host "Skipping large file: $($file.FullName)" -ForegroundColor Yellow
        continue
    }
    
    try {
        $content = Get-Content $file.FullName -Raw -ErrorAction Stop
        $utf8BomEncoding = New-Object System.Text.UTF8Encoding($true)
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8BomEncoding)
        $convertedCount++
        Write-Host "Converted $($file.FullName) to UTF-8 with BOM" -ForegroundColor Green
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "Conversion complete! $convertedCount files were converted to UTF-8 with BOM." -ForegroundColor Cyan 