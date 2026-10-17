[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Query,

    [Parameter(Mandatory = $false)]
    [string]$Repo = "all",

    [Parameter(Mandatory = $false)]
    [int]$Limit = 15
)

$rootDir = Split-Path -Parent $PSScriptRoot
if (-not $rootDir) { $rootDir = (Get-Location).Path }

Write-Host "Searching skill catalog for: '$Query'..." -ForegroundColor Cyan

$results = [System.Collections.Generic.List[PSCustomObject]]::new()

# 1. Search Core Curated Repositories
$sources = @(
    @{ Name = "superpowers"; Path = "$rootDir\superpowers\skills"; Type = "Methodology" },
    @{ Name = "agent-skills"; Path = "$rootDir\agent-skills\skills"; Type = "Vercel Engineering" },
    @{ Name = "skills"; Path = "$rootDir\skills\skills"; Type = "Anthropic Production" },
    @{ Name = "ECC"; Path = "$rootDir\ECC\skills"; Type = "Enterprise Harness" },
    @{ Name = "agents"; Path = "$rootDir\agents\plugins"; Type = "Plugins & Agents" },
    @{ Name = "awesome-claude-skills"; Path = "$rootDir\awesome-claude-skills"; Type = "API Automations" }
)

foreach ($src in $sources) {
    if ($Repo -ne "all" -and $src.Name -ne $Repo) { continue }
    if (Test-Path $src.Path) {
        $skillDirs = Get-ChildItem -Path $src.Path -Directory -ErrorAction SilentlyContinue
        foreach ($d in $skillDirs) {
            $nameMatches = $d.Name -like "*$Query*"
            $desc = ""
            $skillFile = Join-Path $d.FullName "SKILL.md"
            if (-not (Test-Path $skillFile)) {
                $skillFile = Join-Path $d.FullName "README.md"
            }
            
            if (Test-Path $skillFile) {
                # Read first few lines for description
                $head = Get-Content -Path $skillFile -TotalCount 20 -ErrorAction SilentlyContinue | Out-String
                if ($nameMatches -or ($head -like "*$Query*")) {
                    # Extract description from frontmatter or text
                    if ($head -match '(?ms)description:\s*(?:>-\s*)?(.*?)(?:\n[a-z]+:|\n---|\z)') {
                        $desc = ($matches[1] -replace '\s+', ' ').Trim()
                    } elseif ($head -match '(?m)^#\s+(.+)$') {
                        $desc = $matches[1]
                    }
                    if ($desc.Length -gt 120) { $desc = $desc.Substring(0, 117) + "..." }
                    
                    $results.Add([PSCustomObject]@{
                        Name        = $d.Name
                        Repository  = $src.Name
                        Category    = $src.Type
                        RelativePath= $skillFile.Replace($rootDir, "").TrimStart("\/")
                        Description = $desc
                    })
                }
            } elseif ($nameMatches) {
                $results.Add([PSCustomObject]@{
                    Name        = $d.Name
                    Repository  = $src.Name
                    Category    = $src.Type
                    RelativePath= $d.FullName.Replace($rootDir, "").TrimStart("\/")
                    Description = ""
                })
            }
        }
    }
}

# 2. Search Agentic Awesome Skills Catalog JSON
$aasCatalogPath = "$rootDir\agentic-awesome-skills\data\catalog.json"
if (($Repo -eq "all" -or $Repo -eq "agentic-awesome-skills") -and (Test-Path $aasCatalogPath)) {
    try {
        $json = Get-Content -Path $aasCatalogPath -Raw | ConvertFrom-Json
        foreach ($s in $json.skills) {
            if ($s.name -like "*$Query*" -or $s.description -like "*$Query*" -or ($s.tags -join " ") -like "*$Query*") {
                $desc = $s.description
                if ($desc.Length -gt 120) { $desc = $desc.Substring(0, 117) + "..." }
                $results.Add([PSCustomObject]@{
                    Name        = $s.name
                    Repository  = "agentic-awesome-skills"
                    Category    = $s.category
                    RelativePath= "agentic-awesome-skills\skills\$($s.id)\SKILL.md"
                    Description = $desc
                })
            }
        }
    } catch {
        Write-Warning "Could not parse AAS catalog.json: $_"
    }
}

if ($results.Count -eq 0) {
    Write-Host "No skills found matching '$Query'." -ForegroundColor Yellow
} else {
    Write-Host "Found $($results.Count) matching skill(s) (showing top $([Math]::Min($results.Count, $Limit))):" -ForegroundColor Green
    $results | Select-Object -First $Limit | Format-Table Name, Repository, Category, RelativePath, Description -AutoSize
}
