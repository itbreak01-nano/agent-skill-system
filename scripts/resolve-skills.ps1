[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Task,

    [Parameter(Mandatory = $false)]
    [switch]$Json
)

$rootDir = Split-Path -Parent $PSScriptRoot
if (-not $rootDir) { $rootDir = (Get-Location).Path }

$taskLower = $Task.ToLower()

$processSkills   = [System.Collections.Generic.List[string]]::new()
$archSkills      = [System.Collections.Generic.List[string]]::new()
$domainSkills    = [System.Collections.Generic.List[string]]::new()
$verifySkills    = [System.Collections.Generic.List[string]]::new()
$subagentRoles   = [System.Collections.Generic.List[string]]::new()
$frameworkRules  = [System.Collections.Generic.List[string]]::new()

# ----------------------------------------------------
# 1. Intent Classification & Process Layer
# ----------------------------------------------------
if ($taskLower -match '\b(bug|error|exception|fail|crash|fix|debug|broken|slow|issue|reproduce|investigate)\b') {
    $processSkills.Add("systematic-debugging (superpowers)")
    $subagentRoles.Add("silent-failure-hunter (.agents/agents/silent-failure-hunter.md)")
    $verifySkills.Add("verification-before-completion (superpowers)")
    $verifySkills.Add("test-driven-development (superpowers)")
} elseif ($taskLower -match '\b(review|audit|check|inspect|lint|security|vulnerability|perf|assess)\b') {
    $processSkills.Add("subagent-driven-development (superpowers)")
    $processSkills.Add("requesting-code-review (superpowers)")
    $subagentRoles.Add("security-reviewer (.agents/agents/security-reviewer.md)")
    $subagentRoles.Add("performance-optimizer (.agents/agents/performance-optimizer.md)")
    $verifySkills.Add("verification-before-completion (superpowers)")
} else {
    # Default to generative/constructive engineering
    $processSkills.Add("brainstorming (superpowers)")
    $processSkills.Add("writing-plans (superpowers)")
    $processSkills.Add("executing-plans (superpowers)")
    $subagentRoles.Add("spec-miner (.agents/agents/spec-miner.md)")
    $verifySkills.Add("test-driven-development (superpowers)")
    $verifySkills.Add("verification-before-completion (superpowers)")
}

# Always enforce silent failure protection on quality gate
$verifySkills.Add("silent-failure-hunter (.agents/agents/silent-failure-hunter.md)")

# ----------------------------------------------------
# 2. Architecture & Standards Layer
# ----------------------------------------------------
if ($taskLower -match '\b(react|next|nextjs|frontend|ui|component|tailwind|css|vue|svelte|web)\b') {
    $archSkills.Add("react-best-practices (agent-skills)")
    $archSkills.Add("web-design-guidelines (agent-skills)")
}

if ($taskLower -match '\b(sql|database|query|postgres|mysql|sqlite|prisma|drizzle|orm)\b') {
    $archSkills.Add("sql-optimization-patterns (agents/plugins/developer-essentials)")
    $subagentRoles.Add("database-reviewer (.agents/agents/database-reviewer.md)")
}

if ($taskLower -match '\b(auth|jwt|oauth|session|login|signup|password|rbac)\b') {
    $archSkills.Add("auth-implementation-patterns (agents/plugins/developer-essentials)")
    $subagentRoles.Add("security-reviewer (.agents/agents/security-reviewer.md)")
}

if ($taskLower -match '\b(monorepo|nx|turborepo|lerna|workspaces)\b') {
    $archSkills.Add("monorepo-management (agents/plugins/developer-essentials)")
    $archSkills.Add("turborepo-caching (agents/plugins/developer-essentials)")
}

if ($taskLower -match '\b(security|sanitize|xss|csrf|penetration|audit)\b') {
    $archSkills.Add("security-scanning (agents/plugins)")
    $archSkills.Add("security-review (ECC/skills)")
    $subagentRoles.Add("security-reviewer (.agents/agents/security-reviewer.md)")
}

# ----------------------------------------------------
# 3. Framework & Language Rulesets (ECC/rules)
# ----------------------------------------------------
$rulesMap = @{
    "python"     = "ECC/rules/python";
    "fastapi"    = "ECC/rules/python";
    "django"     = "ECC/rules/python";
    "typescript" = "ECC/rules/typescript";
    "javascript" = "ECC/rules/typescript";
    "react"      = "ECC/rules/react";
    "vue"        = "ECC/rules/vue";
    "golang"     = "ECC/rules/golang";
    "go"         = "ECC/rules/golang";
    "rust"       = "ECC/rules/rust";
    "java"       = "ECC/rules/java";
    "kotlin"     = "ECC/rules/kotlin";
    "cpp"        = "ECC/rules/cpp";
    "csharp"     = "ECC/rules/csharp";
    "dotnet"     = "ECC/rules/csharp";
    "swift"      = "ECC/rules/swift";
    "angular"    = "ECC/rules/angular"
}

foreach ($key in $rulesMap.Keys) {
    if ($taskLower -match "\b$key\b") {
        $val = $rulesMap[$key]
        if ($frameworkRules -notcontains $val) {
            $frameworkRules.Add($val)
        }
    }
}

# ----------------------------------------------------
# 4. Domain & Technology Implementation Layer
# ----------------------------------------------------
# Documents & Office
if ($taskLower -match '\b(excel|xlsx|spreadsheet|sheets|csv)\b') {
    $domainSkills.Add("xlsx (skills/Anthropic - includes recalc.py validator)")
}
if ($taskLower -match '\b(pdf|acrobat)\b') {
    $domainSkills.Add("pdf (skills/Anthropic)")
}
if ($taskLower -match '\b(docx|word|document)\b') {
    $domainSkills.Add("docx (skills/Anthropic - includes schema validator)")
}
if ($taskLower -match '\b(pptx|powerpoint|slides|presentation|pitch deck)\b') {
    $domainSkills.Add("pptx (skills/Anthropic - includes slide validator)")
}

# Backend Stacks & DevOps
if ($taskLower -match '\b(python|django|fastapi|flask|pytest)\b') {
    $domainSkills.Add("python-development (agents/plugins)")
}
if ($taskLower -match '\b(typescript|javascript|node|express)\b') {
    $domainSkills.Add("javascript-typescript (agents/plugins)")
}
if ($taskLower -match '\b(docker|container|compose)\b') {
    $domainSkills.Add("docker-patterns (ECC/skills)")
}
if ($taskLower -match '\b(kubernetes|k8s|helm)\b') {
    $domainSkills.Add("kubernetes-operations (agents/plugins)")
}
if ($taskLower -match '\b(mcp|model context protocol)\b') {
    $domainSkills.Add("mcp-builder (skills/Anthropic)")
}

# Niche Community Skills Search in AAS Catalog
$words = $taskLower -split '\s+' | Where-Object { $_.Length -gt 3 -and $_ -notmatch '^(build|create|implement|with|this|that|your|using|make|from|into|have|want|need|help|like)$' }
$aasCatalogPath = "$rootDir\agentic-awesome-skills\data\catalog.json"
if (Test-Path $aasCatalogPath) {
    try {
        $json = Get-Content -Path $aasCatalogPath -Raw | ConvertFrom-Json
        foreach ($w in $words) {
            $found = $json.skills | Where-Object { $_.id -like "*$w*" -or $_.tags -contains $w } | Select-Object -First 2
            foreach ($f in $found) {
                if ($f.name -and ($domainSkills -notcontains "$($f.name) (AAS)")) {
                    $domainSkills.Add("$($f.name) (AAS)")
                }
            }
        }
    } catch {}
}

$recipe = [PSCustomObject]@{
    Task                 = $Task
    ProcessLayer         = $processSkills | Select-Object -Unique
    ArchitectureLayer    = $archSkills | Select-Object -Unique
    FrameworkRules       = $frameworkRules | Select-Object -Unique
    DomainLayer          = $domainSkills | Select-Object -Unique -First 4
    SubagentsToDispatch  = $subagentRoles | Select-Object -Unique
    VerificationLayer    = $verifySkills | Select-Object -Unique
}

if ($Json) {
    $recipe | ConvertTo-Json -Depth 5
} else {
    Write-Host "`n=== ADVANCED 4-LAYER MULTI-SKILL ORCHESTRATION RECIPE ===" -ForegroundColor Cyan
    Write-Host "Task: `"$Task`"`n" -ForegroundColor White
    
    Write-Host "1. Process Layer (How to think & execute):" -ForegroundColor Yellow
    foreach ($p in $recipe.ProcessLayer) { Write-Host "   - $p" -ForegroundColor White }
    
    Write-Host "`n2. Architecture & Standards Layer:" -ForegroundColor Yellow
    if ($recipe.ArchitectureLayer.Count -eq 0) { Write-Host "   - General Clean Architecture & Defensive Engineering" -ForegroundColor DarkGray }
    foreach ($a in $recipe.ArchitectureLayer) { Write-Host "   - $a" -ForegroundColor White }
    
    if ($recipe.FrameworkRules.Count -gt 0) {
        Write-Host "`n   [Framework Specific Rulesets to Load]:" -ForegroundColor DarkCyan
        foreach ($r in $recipe.FrameworkRules) { Write-Host "     * $r" -ForegroundColor Cyan }
    }
    
    Write-Host "`n3. Domain & Technology Implementation Layer:" -ForegroundColor Yellow
    if ($recipe.DomainLayer.Count -eq 0) { Write-Host "   - Core Full-Stack Engineering" -ForegroundColor DarkGray }
    foreach ($d in $recipe.DomainLayer) { Write-Host "   - $d" -ForegroundColor White }
    
    if ($recipe.SubagentsToDispatch.Count -gt 0) {
        Write-Host "`n4. Recommended Subagent Delegations:" -ForegroundColor Magenta
        foreach ($s in $recipe.SubagentsToDispatch) { Write-Host "   - $s" -ForegroundColor White }
    }
    
    Write-Host "`n5. Quality Gate & Verification Layer:" -ForegroundColor Green
    foreach ($v in $recipe.VerificationLayer) { Write-Host "   - $v" -ForegroundColor White }
    
    Write-Host "`n[Automated Action]: Load referenced SKILL.md and rules before modifying code.`n" -ForegroundColor Green
}
