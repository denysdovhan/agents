# Denys Dovhan Agent Skills

This repository stores custom-made skills for AI agents.

## Included Skills

| Skill | Description |
|---|---|
| [`commit`](skills/commit/SKILL.md) | Prepare focused git commits with scoped staging and clear commit messages. |
| [`home-assistant-integration`](skills/home-assistant-integration/SKILL.md) | Create, scaffold, review, and maintain Python Home Assistant custom integrations using current developer docs and quality rules. |

## Local Validation

Run the repository validation script:

```bash
./scripts/validate-skills.sh
```

The script bootstraps `skills-ref` automatically into `.skill-ref/skills-ref` with a shallow clone if it is missing.

Validate a single skill directly:

```bash
.skill-ref/skills-ref/.venv/bin/skills-ref validate skills/commit
```

## License

[MIT](LICENSE) © [Denys Dovhan](https://github.com/denysdovhan)
