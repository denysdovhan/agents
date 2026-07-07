# Repository Guidelines

## Project Structure & Module Organization

This repository contains reusable agent skills:

- `skills/<skill-name>/SKILL.md` is required for every skill.
- `skills/<skill-name>/agents/openai.yaml` contains optional OpenAI UI metadata.
- `skills/<skill-name>/assets/` contains icons and other bundled assets.
- `skills/<skill-name>/references/` contains longer supporting docs.
- `scripts/` contains repository tooling.
- `.github/workflows/` contains CI configuration.
- `.skill-ref/` is a local bootstrap clone for validation tooling; do not edit
  it as source.

## Build, Test, and Development Commands

Run all validation before finishing skill changes:

```bash
./scripts/validate-skills.sh
```

This bootstraps `skills-ref` into `.skill-ref/skills-ref` if needed and
validates every skill under `skills/`. To validate one skill directly after the
bootstrap exists, run:

```bash
.skill-ref/skills-ref/.venv/bin/skills-ref validate skills/commit
```

There is no build step; this is a documentation and asset repository.

## Coding Style & Naming Conventions

Use Markdown for skill instructions and YAML for metadata. Skill directory names
must match the `name` field in `SKILL.md`, using lowercase hyphenated names
such as `home-assistant-integration`. Keep `SKILL.md` focused on actionable
workflow guidance. Put reusable reference material in `references/` instead of
expanding the main skill file unnecessarily. Use relative asset paths in
`agents/openai.yaml`, for example `./assets/git.png`.

When creating or substantially updating skills, all agents must use the
`skill-creator` skill and follow its guidance before editing skill files.

## Testing Guidelines

Validation is schema-based through `skills-ref`; there are no unit tests or
coverage targets. Add or update assets and references only when they are used by
a skill or its metadata. After changing `SKILL.md`, metadata, references, or
assets, run `./scripts/validate-skills.sh` and `git diff --check`.

## Commit & Pull Request Guidelines

Use conventional commits with a concise imperative subject, for example
`feat: add design-log skill` or `docs: add skill icons to README`. Keep commits
focused by skill or concern.

Pull requests should summarize what skill changed, why it changed, and which
validation commands passed. Include screenshots only when UI-facing icon or
README rendering changes need visual review.
