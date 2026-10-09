param(
    [Parameter(Mandatory = $false)]
    [string]$ProjectRoot = "C:\Users\WinDows\Desktop\yalabena-main"
)

$ErrorActionPreference = 'Stop'
$ProjectRoot = [System.IO.Path]::GetFullPath($ProjectRoot)
$PatchRoot = $PSScriptRoot

$requiredProjectFiles = @(
    'front/src/App.tsx',
    'front/src/components/layout/Sidebar.tsx',
    'front/src/api/index.ts'
)
foreach ($relative in $requiredProjectFiles) {
    $target = Join-Path $ProjectRoot $relative
    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
        throw "Project validation failed: '$target' was not found. No files were changed. Verify -ProjectRoot points to your yalabena-main folder."
    }
}

$filesToCopy = @(
    'front/src/api/kb.ts',
    'front/src/api/reports.ts',
    'front/src/api/index.ts',
    'front/src/pages/KnowledgeBase.tsx',
    'front/src/pages/Reports.tsx',
    'front/src/App.tsx',
    'front/src/routes/index.tsx',
    'front/src/components/layout/Sidebar.tsx'
)
foreach ($relative in $filesToCopy) {
    $source = Join-Path $PatchRoot $relative
    if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
        throw "Patch validation failed: '$source' is missing. No files were changed."
    }
}

Write-Host "Project: $ProjectRoot" -ForegroundColor Cyan
Write-Host "Files to add/replace: $($filesToCopy.Count)" -ForegroundColor Cyan
Write-Host 'No files will be deleted. Existing target files will be backed up outside the project folder.' -ForegroundColor Yellow
$confirmation = Read-Host 'Type APPLY to continue'
if ($confirmation -cne 'APPLY') {
    Write-Host 'Cancelled. No files were changed.' -ForegroundColor Yellow
    exit 0
}

$timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$backupRoot = "$ProjectRoot.backup-$timestamp"
New-Item -ItemType Directory -Path $backupRoot -Force | Out-Null
$existingTargets = @{}

# Back up all existing target files before copying any patch files.
foreach ($relative in $filesToCopy) {
    $target = Join-Path $ProjectRoot $relative
    $existingTargets[$relative] = Test-Path -LiteralPath $target -PathType Leaf
    if ($existingTargets[$relative]) {
        $backup = Join-Path $backupRoot $relative
        $backupParent = Split-Path -Parent $backup
        New-Item -ItemType Directory -Path $backupParent -Force | Out-Null
        Copy-Item -LiteralPath $target -Destination $backup -Force
    }
}

try {
    foreach ($relative in $filesToCopy) {
        $source = Join-Path $PatchRoot $relative
        $target = Join-Path $ProjectRoot $relative
        $targetParent = Split-Path -Parent $target
        New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
        Copy-Item -LiteralPath $source -Destination $target -Force
        Write-Host "Updated: $relative"
    }
}
catch {
    Write-Host 'An error occurred while copying. Restoring the backed-up files...' -ForegroundColor Red
    foreach ($relative in $filesToCopy) {
        $backup = Join-Path $backupRoot $relative
        $target = Join-Path $ProjectRoot $relative
        if (Test-Path -LiteralPath $backup -PathType Leaf) {
            Copy-Item -LiteralPath $backup -Destination $target -Force
        } elseif (-not $existingTargets[$relative] -and (Test-Path -LiteralPath $target -PathType Leaf)) {
            # Remove only a new patch file created by this failed run, never a pre-existing user file.
            Remove-Item -LiteralPath $target -Force
        }
    }
    throw
}

Write-Host ''
Write-Host 'Patch files copied. No files were deleted.' -ForegroundColor Green
Write-Host "Backup folder: $backupRoot" -ForegroundColor Green
Write-Host 'Next: run the frontend build commands in the README. If anything looks wrong, restore the backed-up files from the backup folder.' -ForegroundColor Cyan
