<#
.SYNOPSIS
    Master 1-Click Setup Script for AI Agent Skill System (Antigravity & OpenAI Codex)
.DESCRIPTION
    Sets up the entire 12,000+ skill architecture, 4-layer orchestrator, 17 foundational skills,
    and 8 specialized subagent profiles on any machine for both Google Antigravity and OpenAI Codex.
#>

[CmdletBinding()]
param()

$root = $PSScriptRoot
if (-not $root) { $root = (Get-Location).Path }

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "   AI AGENT SKILL SYSTEM 1-CLICK AUTONOMOUS SETUP       " -ForegroundColor Cyan
Write-Host "   Antigravity & OpenAI Codex Level 5 Agent Elevation   " -ForegroundColor Cyan
Write-Host "========================================================`n" -ForegroundColor Cyan

# 1. Verify/Clone Skill Repositories
$repos = @(
    @{ Name = "superpowers"; Url = "https://github.com/obra/superpowers.git" },
    @{ Name = "agent-skills"; Url = "https://github.com/vercel-labs/agent-skills.git" },
    @{ Name = "skills"; Url = "https://github.com/anthropics/skills.git" },
    @{ Name = "ECC"; Url = "https://github.com/affaan-m/ECC.git" },
    @{ Name = "agents"; Url = "https://github.com/wshobson/agents.git" },
    @{ Name = "awesome-claude-skills"; Url = "https://github.com/ComposioHQ/awesome-claude-skills.git" },
    @{ Name = "agentic-awesome-skills"; Url = "https://github.com/sickn33/agentic-awesome-skills.git" }
)

Write-Host "[1/5] Checking Skill Repositories..." -ForegroundColor Yellow
foreach ($r in $repos) {
    $targetPath = Join-Path $root $r.Name
    if (-not (Test-Path $targetPath)) {
        Write-Host "  Cloning $($r.Name)..." -ForegroundColor White
        git clone --depth 1 $r.Url $targetPath
    } else {
        Write-Host "  Found $($r.Name)" -ForegroundColor DarkGray
    }
}

# 2. Configure Antigravity (Local Workspace + Global Profile)
Write-Host "`n[2/5] Configuring Google Antigravity..." -ForegroundColor Yellow

$localAgentsSkills = Join-Path $root ".agents\skills"
$localAgentsRules  = Join-Path $root ".agents\rules"
$localAgentsAgents = Join-Path $root ".agents\agents"
$globalGeminiSkills = "$HOME\.gemini\config\skills"
$globalGeminiRules  = "$HOME\.gemini\config\rules"
$globalGeminiScripts= "$HOME\.gemini\scripts"

foreach ($dir in @($localAgentsSkills, $localAgentsRules, $localAgentsAgents, $globalGeminiSkills, $globalGeminiRules, $globalGeminiScripts)) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
}

# Mount foundational skills list
$foundationalSkills = @(
    @{ Name = "using-superpowers"; Target = "$root\superpowers\skills\using-superpowers" },
    @{ Name = "systematic-debugging"; Target = "$root\superpowers\skills\systematic-debugging" },
    @{ Name = "test-driven-development"; Target = "$root\superpowers\skills\test-driven-development" },
    @{ Name = "verification-before-completion"; Target = "$root\superpowers\skills\verification-before-completion" },
    @{ Name = "brainstorming"; Target = "$root\superpowers\skills\brainstorming" },
    @{ Name = "subagent-driven-development"; Target = "$root\superpowers\skills\subagent-driven-development" },
    @{ Name = "writing-plans"; Target = "$root\superpowers\skills\writing-plans" },
    @{ Name = "executing-plans"; Target = "$root\superpowers\skills\executing-plans" },
    @{ Name = "react-best-practices"; Target = "$root\agent-skills\skills\react-best-practices" },
    @{ Name = "web-design-guidelines"; Target = "$root\agent-skills\skills\web-design-guidelines" },
    @{ Name = "writing-guidelines"; Target = "$root\agent-skills\skills\writing-guidelines" },
    @{ Name = "docx"; Target = "$root\skills\skills\docx" },
    @{ Name = "pdf"; Target = "$root\skills\skills\pdf" },
    @{ Name = "pptx"; Target = "$root\skills\skills\pptx" },
    @{ Name = "xlsx"; Target = "$root\skills\skills\xlsx" },
    @{ Name = "mcp-builder"; Target = "$root\skills\skills\mcp-builder" },
    @{ Name = "webapp-testing"; Target = "$root\skills\skills\webapp-testing" }
)

foreach ($s in $foundationalSkills) {
    if (Test-Path $s.Target) {
        # Workspace Antigravity
        $wsDest = Join-Path $localAgentsSkills $s.Name
        if (-not (Test-Path $wsDest)) { New-Item -ItemType Junction -Path $wsDest -Target $s.Target | Out-Null }
        
        # Global Antigravity
        $glDest = Join-Path $globalGeminiSkills $s.Name
        if (-not (Test-Path $glDest)) { New-Item -ItemType Junction -Path $glDest -Target $s.Target | Out-Null }
    }
}

# Copy rules globally & locally
if (Test-Path "$root\.agents\rules") {
    Copy-Item -Path "$root\.agents\rules\*" -Destination $globalGeminiRules -Force -ErrorAction SilentlyContinue
}
if (Test-Path "$root\AGENTS.md") {
    Copy-Item -Path "$root\AGENTS.md" -Destination "$HOME\.gemini\GEMINI.md" -Force -ErrorAction SilentlyContinue
}
if (Test-Path "$root\scripts") {
    Copy-Item -Path "$root\scripts\*" -Destination $globalGeminiScripts -Force -ErrorAction SilentlyContinue
}
Write-Host "  Antigravity configured successfully!" -ForegroundColor Green

# 3. Configure OpenAI Codex
Write-Host "`n[3/5] Configuring OpenAI Codex..." -ForegroundColor Yellow
$codexHome = "$HOME\.codex"
$codexSkills = "$codexHome\skills"
$codexAgents = "$codexHome\agents"
$codexConfig = "$codexHome\config.toml"

foreach ($dir in @($codexSkills, $codexAgents)) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
}

# Mount Codex skills
foreach ($s in $foundationalSkills) {
    if (Test-Path $s.Target) {
        $cdxDest = Join-Path $codexSkills $s.Name
        if (-not (Test-Path $cdxDest)) { New-Item -ItemType Junction -Path $cdxDest -Target $s.Target | Out-Null }
    }
}

# Mount Codex subagents
$agentFiles = @(
    "silent-failure-hunter.md",
    "security-reviewer.md",
    "performance-optimizer.md",
    "database-reviewer.md",
    "spec-miner.md",
    "type-design-analyzer.md",
    "refactor-cleaner.md",
    "e2e-runner.md"
)
foreach ($af in $agentFiles) {
    $src = Join-Path $root "ECC\agents\$af"
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination (Join-Path $codexAgents $af) -Force
    }
}

# Copy AGENTS.md to Codex
if (Test-Path "$root\AGENTS.md") {
    Copy-Item -Path "$root\AGENTS.md" -Destination "$codexHome\AGENTS.md" -Force
}

# Ensure multi_agent is true in config.toml
if (Test-Path $codexConfig) {
    $cfg = Get-Content -Path $codexConfig -Raw
    if ($cfg -notmatch 'multi_agent\s*=\s*true') {
        Add-Content -Path $codexConfig -Value "`n[features]`nmulti_agent = true`n"
    }
}
Write-Host "  OpenAI Codex configured successfully!" -ForegroundColor Green

# 4. Add Project to Codex Trusted Projects
if (Test-Path $codexConfig) {
    $cfg = Get-Content -Path $codexConfig -Raw
    $escapedRoot = $root -replace '\\', '\\'
    if ($cfg -notmatch [regex]::Escape($escapedRoot)) {
        $trustBlock = "`n[projects.`"$escapedRoot`"]`ntrust_level = `"trusted`"`n"
        Add-Content -Path $codexConfig -Value $trustBlock
        Write-Host "  Added $root to Codex trusted projects." -ForegroundColor Green
    }
}

# 5. Summary & Verification
Write-Host "`n[4/5] Verifying 4-Layer Skill Orchestration Engine..." -ForegroundColor Yellow
powershell -ExecutionPolicy Bypass -File "$root\scripts\resolve-skills.ps1" -Task "Build Next.js webapp with Excel reports"

Write-Host "`n========================================================" -ForegroundColor Green
Write-Host "  SETUP COMPLETE! Both Antigravity & Codex are Elevated!" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
Write-Host "Quick commands to run anytime:"
Write-Host "  Find any skill:     powershell .\scripts\find-skill.ps1 -Query <topic>"
Write-Host "  Resolve recipe:     powershell .\scripts\resolve-skills.ps1 -Task <task>"
