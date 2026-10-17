---
name: fastapi-async-db-guard
description: Prevents database connection leaks and pool exhaustion in high-concurrency FastAPI applications
category: self-learned
author: autonomous-self-learning-engine
generated_at: 2026-10-17T17:19:47Z
---

# fastapi-async-db-guard

## Overview
Prevents database connection leaks and pool exhaustion in high-concurrency FastAPI applications

## When to Use
Activate this skill when encountering similar tasks, constraints, or bug patterns.

## Proven Strategy & Solution Pattern
Always use async context managers ('async with AsyncSessionLocal() as session:') with explicit try/finally rollback blocks and configure pool_pre_ping=True, pool_size=20, max_overflow=10 in SQLAlchemy engine initialization.

## Anti-Patterns to Avoid
1. Never yield session without finally: await session.close(). 2. Never share session instances across background tasks or global state.

## Verification Command
Execute the following verification command to prove efficacy:
``bash
pytest tests/test_db_sessions.py -k test_connection_cleanup
``

## Continuous Improvement Protocol
If this skill is modified or enhanced during a future turn:
1. Re-run `powershell .\scripts\self-learn.ps1` with updated learnings.
2. Confirm the updated skill passes test verification before committing.
