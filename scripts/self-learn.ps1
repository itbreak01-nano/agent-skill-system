[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$SkillName,

    [Parameter(Mandatory = $true, Position = 1)]
    [string]$Description,

    [Parameter(Mandatory = $true)]
    [string]$LearnedPattern,

    [Parameter(Mandatory = $false)]
    [string]$Category = "self-learned",

    [Parameter(Mandatory = $false)]
    [string]$AntiPatterns = "",

    [Parameter(Mandatory = $false)]
    [string]$VerificationCommand = ""
)

$rootDir = Split-Path -Parent $PSScriptRoot
if (-not $rootDir) { $rootDir = (Get-Location).Path }

# Normalize skill name
$cleanName = ($SkillName.ToLower() -replace '[^a-z0-9\-]', '-') -replace '-+', '-'

Write-Host "`n=== AUTONOMOUS AGENT SELF-LEARNING ENGINE ===" -ForegroundColor Cyan
Write-Host "Distilling new skill: '$cleanName'..." -ForegroundColor White

# 1. Target Directories
$workspaceSkillDir = Join-Path $rootDir ".agents\skills\$cleanName"
$globalGeminiDir   = "$HOME\.gemini\config\skills\$cleanName"
$globalCodexDir    = "$HOME\.codex\skills\$cleanName"

foreach ($dir in @($workspaceSkillDir, $globalGeminiDir, $globalCodexDir)) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
}

# 2. Build Markdown content cleanly
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add("---")
$lines.Add("name: $cleanName")
$lines.Add("description: $Description")
$lines.Add("category: $Category")
$lines.Add("author: autonomous-self-learning-engine")
$lines.Add("generated_at: $(Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ')")
$lines.Add("---")
$lines.Add("")
$lines.Add("# $cleanName")
$lines.Add("")
$lines.Add("## Overview")
$lines.Add($Description)
$lines.Add("")
$lines.Add("## When to Use")
$lines.Add("Activate this skill when encountering similar tasks, constraints, or bug patterns.")
$lines.Add("")
$lines.Add("## Proven Strategy & Solution Pattern")
$lines.Add($LearnedPattern)

if ($AntiPatterns) {
    $lines.Add("")
    $lines.Add("## Anti-Patterns to Avoid")
    $lines.Add($AntiPatterns)
}

if ($VerificationCommand) {
    $lines.Add("")
    $lines.Add("## Verification Command")
    $lines.Add("Execute the following verification command to prove efficacy:")
    $lines.Add("````bash")
    $lines.Add($VerificationCommand)
    $lines.Add("````")
}

$lines.Add("")
$lines.Add("## Continuous Improvement Protocol")
$lines.Add("If this skill is modified or enhanced during a future turn:")
$lines.Add("1. Re-run ``powershell .\scripts\self-learn.ps1`` with updated learnings.")
$lines.Add("2. Confirm the updated skill passes test verification before committing.")

$skillMdContent = $lines -join "`n"

# 3. Write SKILL.md to all target runtimes
Set-Content -Path (Join-Path $workspaceSkillDir "SKILL.md") -Value $skillMdContent -Encoding utf8
Set-Content -Path (Join-Path $globalGeminiDir "SKILL.md") -Value $skillMdContent -Encoding utf8
Set-Content -Path (Join-Path $globalCodexDir "SKILL.md") -Value $skillMdContent -Encoding utf8

Write-Host "  [OK] Saved to Workspace: .agents/skills/$cleanName/SKILL.md" -ForegroundColor Green
Write-Host "  [OK] Hot-loaded to Global Antigravity: ~/.gemini/config/skills/$cleanName" -ForegroundColor Green
Write-Host "  [OK] Hot-loaded to Global Codex: ~/.codex/skills/$cleanName" -ForegroundColor Green

# 4. Refresh SKILL_INDEX.md
$indexFile = Join-Path $rootDir "SKILL_INDEX.md"
if (Test-Path $indexFile) {
    $entry = "`n| **`$cleanName`** | `.agents/skills/$cleanName` | $Description |"
    Add-Content -Path $indexFile -Value $entry
    Write-Host "  [OK] Updated SKILL_INDEX.md" -ForegroundColor Green
}

Write-Host "`nSkill '$cleanName' is now active, persistent, and globally accessible across all sessions!`n" -ForegroundColor Cyan
