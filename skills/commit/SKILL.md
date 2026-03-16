---
name: commit
description: Use this skill when an agent needs to prepare a focused commit, write a clear commit message, and create the git commit cleanly.
---

# Commit Skill

Use this skill when the work is already implemented and the next step is to create a clean git commit.

## Goals

- Keep the commit scoped to the intended change
- Write a concise, descriptive commit message
- Avoid including unrelated modified files

## Workflow

1. Inspect the working tree before committing.
2. Confirm which files belong to the requested change.
3. Stage only the relevant files.
4. Write a commit message that summarizes the user-visible change.
5. Create the commit without rewriting unrelated history.

## Guidelines

- Do not stage unrelated files just to make the tree clean.
- Prefer one focused commit over a mixed commit.
- Use imperative commit subjects such as `Add skill validation workflow`.
- If the tree contains unexpected changes, call them out before committing.
- Do not amend existing commits unless explicitly requested.
