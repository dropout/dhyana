---
name: Feature Workflow
description: "Run the multi-agent workflow for a Dhyana feature: plan per-package briefs, implement, test, verify, review. Use when a feature or change touches one or more packages or alters a public contract."
argument-hint: "e.g. 'Add streak reminder setting to profile and show it on home'"
agent: agent
---

Deliver the requested feature using the roles in `ai/agents/`.

Input: feature description. If it is vague on behavior, scope or affected modules, ask the user (one question at a time) before planning.

## Phase 0 - Preflight
- Read `AGENTS.md` and `ai/agents/architect.md`; act as the architect.
- Check the git tree is clean or note unrelated changes; don't touch them.
- Identify affected packages from barrels and public APIs. Stop and ask if the feature needs a new module (see `ai/skills/module-scaffold`).

## Phase 1 - Plan (architect)
Produce, and show to the user for approval:
1. Affected packages in dependency order (lower-level first), marking which can run in parallel.
2. Contracts per package: exact signatures for public APIs, ports, public models, routes, l10n keys.
3. One task brief per package in the format from `ai/agents/architect.md`.
4. Risks and open questions.

Do not start implementation until the user approves the plan. Skip approval only for a single-package change with no contract change.

## Phase 2 - Implement (module-implementer)
- For each package in order, run `ai/agents/module-implementer.md` with its brief.
- One writer per package at a time. Independent packages may run in parallel.
- If an implementer reports a missing contract, update the owning package's brief first, then resume.
- Contract changes during implementation go back to the user if they alter behavior or scope.

## Phase 3 - Tests (test-writer)
- Run `ai/agents/test-writer.md` per package after its implementation is done.
- Production code is not changed by this step; testability findings and bugs return to Phase 2 as a follow-up brief.

## Phase 4 - Integrate (architect)
- Apply app wiring (`ai/skills/module-scaffold` section 5) if required.
- Run `ai/skills/verify-package` for every changed package, then analyze dependents and `apps/mobile_app`.
- Run `melos run codegen` / `melos run codegen:l10n` first if generated files are stale.

## Phase 5 - Review (reviewer)
- Run `ai/agents/reviewer.md` on the full diff with the briefs.
- Fix blocker/major issues through Phase 2 follow-up briefs, then re-verify and re-review only the affected packages. Max two review rounds; then report remaining issues to the user.

## Rules
- Do not commit or push unless asked.
- Don't fix unrelated legacy issues; list them.
- Keep outputs concise; no narrative summaries.

## Final report
- Packages changed and what changed in each.
- Contracts added/changed.
- Verification and review results (commands, pass/fail).
- Not done / follow-ups / legacy issues observed.
