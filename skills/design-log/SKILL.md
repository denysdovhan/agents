---
name: design-log
description: Use this skill to maintain a design log in .agents/log, a decision journal shared by the developer and agents. Trigger when the user explicitly asks to use design-log or record/update a design log entry; when planning, implementing, or finalizing a significant feature in a repo with an existing .agents/log; or before non-trivial changes or questions in areas covered by existing entries. Never initialize .agents/log unless the user explicitly asks for a design log.
---

# Design Log

Maintain `.agents/log/` — a version-controlled journal of product and engineering decisions, tradeoffs, and directions, co-owned by the developer and agents. Entries capture *why* — the reasoning that code and git history cannot recover. Inspired by the [design-log methodology](https://github.com/yoavaa/design-log-methodology).

## Layout

- `.agents/log/index.md` — index of all entries
- `.agents/log/YYYY-MM-DD-slug.md` — one entry per feature or decision

Initialize `.agents/log/` only when the user explicitly asks — by invoking this skill or directly requesting a design log. If `.agents/log/` is absent otherwise, do not create it, even when a plan is approved. When initializing, create `.agents/log/index.md` with the table header from Index Format; create an entry only if the current task records a decision.

## Entry Format

```markdown
---
title: Human-readable decision or feature title
date: YYYY-MM-DD
status: wip | done
related_paths:
  - src/feature-area/
  - src/shared/specific-file.ts
---

## Background

Context needed to understand the problem. Link related entries as
[title](YYYY-MM-DD-other-entry.md).

## Problem

What is being solved and why now.

## Questions & Answers

Clarifying questions asked and the user's answers. Open questions stay
here until resolved.

## Decision

The chosen design. Concrete: file paths, type signatures, data shapes.
Mark examples with ✅ (do) and ❌ (don't) — the canonical notation for all
entries. Use Mermaid diagrams only when they clarify the decision.

## Tradeoffs & Alternatives

Rejected options and why. This section prevents re-litigating decisions
later.

## Implementation Plan

Phases or steps, when the entry starts as a plan draft.

## Verification

How success is checked, as a checklist:

- [ ] Tests, behaviors, or measurable criteria
- [ ] Manual checks that need a human

## Implementation Notes

Dated notes appended during and after implementation: deviations from
the plan, discoveries, test outcomes.
```

Omit sections that have no content. Keep entries short and decision-focused — do not document what the code or git history already states.

## Index Format

`index.md` holds a single markdown table:

```markdown
| Entry | Date | Status | Description | Related paths |
|---|---|---|---|---|
| [Dark mode toggle](2026-07-07-dark-mode-toggle.md) | 2026-07-07 | done | Theme switching via CSS variables | `src/theme/` |
```

Keep entries sorted newest first. Update the index whenever an entry is created, renamed, or its status changes.

## Recall: Read Before You Write

Before drafting a plan or making non-trivial changes in a repo that has `.agents/log/`:

1. Read `index.md`.
2. Read entries whose `related_paths` overlap the files or areas being touched. If the index seems stale, grep entry frontmatter directly. Also grep entry bodies for 2-3 keywords from the request — path overlap alone misses cross-cutting decisions.
3. Surface relevant prior decisions to the user before asking clarifying questions — they may answer the questions or reshape the request.
4. Treat `done` entries as binding constraints. Treat `wip` entries as current direction. When entries conflict, the newer one wins.
5. If the requested change contradicts a `done` entry, surface the conflict to the user before proceeding. Resolution is a new entry recording the new decision and linking the old one, not a silent edit.
6. When answering questions about existing behavior or past decisions, cite the relevant entry by title and link.

Read `index.md` and matching entries with the agent's normal file-reading tool. When the log is large, narrow down which entries to read first:

```bash
rg -l "src/feature-area|src/shared/file.ts" .agents/log   # entries touching the paths being changed
rg -il "keyword1|keyword2" .agents/log                    # cross-cutting decisions by topic
```

Replace the placeholders with the touched paths and 2-3 keywords from the user request, then read the matching entries in full — do not rely on match snippets alone.

## Write Workflow

### 1. Ask clarifying questions before implementation

Before drafting a plan or entry for a significant feature or architectural change:

- Run the recall steps above and surface relevant prior decisions first.
- Ask specific clarifying questions about scope, behavior, and tradeoffs that the request, the codebase, and prior entries do not already answer. Prefer 2-4 concrete options per question and mark a recommended one.
- Use the agent's structured question tool when available; otherwise ask a short numbered list in plain text.
- Wait for answers before designing. Record the questions and answers in the entry's Questions & Answers section.
- Do not manufacture questions for trivial scope — zero questions is fine when the request is already unambiguous.

### 2. Draft when a plan is approved

When the user approves a plan for a significant feature or architectural change, create a draft entry as the first implementation step — but only if `.agents/log/` already exists or the user explicitly asked for a design log. Otherwise skip the entry; plan approval alone never initializes the log.

- Name it `YYYY-MM-DD-slug.md` using today's date.
- Set `status: wip` and fill `related_paths` with the folders and files the plan touches.
- Seed the sections from the plan text; record clarifying questions and answers already given.
- Add it to `index.md`.

### 3. Update freely while WIP

While `status: wip`, the entry is a living document. Update it as decisions change, questions get answered, and the plan deviates. Keep `related_paths` in sync with where the work actually landed.

### 4. Finalize when the feature is done

When the user says the feature is finished — or asks directly — finalize the entry:

- Make sections reflect what was actually built; record final deviations and test outcomes in Implementation Notes.
- Check off Verification items that passed. Do not mark an entry `done` while items are unchecked — either verify them, or record in Implementation Notes that the user explicitly waived them.
- Set `status: done` and update `index.md`.

If the user wraps up a feature without mentioning the log, ask once whether to finalize the entry.

### 5. Done entries are frozen

Never edit a `done` entry. Follow-up work on the same area — including decisions that override it — gets a new entry that links back to the old one.

## Handling Feedback During Implementation

| Feedback | Action |
|---|---|
| Clarification question | Answer, citing entries; no log change |
| Bug in the implementation | Fix it; note it in Implementation Notes |
| Missed constraint or edge case | Append to Questions & Answers and Verification; adjust Decision if it changes |
| Refinement of the current design | Update the `wip` entry |
| Scope expansion or a separate decision | Create a new entry linking back; do not overload the current one |

When uncertain which type it is, state your assumptions and ask.

## Guidelines

- Log significant features, architectural changes, and directional decisions. Skip trivial fixes, refactors with no decision content, and routine chores.
- The developer edits entries too: never delete or rewrite user-authored content in an entry — append or ask.
- One entry per feature or decision. If work spans multiple independent decisions, split it.
- Prefer appending to an existing `wip` entry for follow-up prompts on the same feature; create a new entry when scope clearly grows into a separate decision. Ask when unclear.
- Do not put secrets, credentials, or private user data in entries.
