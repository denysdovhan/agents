# Card Workflow

Use this file when inspecting a custom card repository, planning a change, or validating local output.

## Inspect First

Read local instructions before editing:

- `AGENTS.md`, `CLAUDE.md`, README files, release notes, and issue/PR context
- `package.json`, lockfile, package-manager config, build scripts, lint scripts, and test scripts
- Source entrypoint, custom element registration, editor implementation, config/types helpers, localization, styles, images, and bundled output config
- HACS metadata such as `hacs.json`, repository topics, release assets, and README installation steps

## Implementation Areas

| Area | Check |
|---|---|
| Entrypoint | Registers exactly the custom element name documented by the card type. |
| Config | Validates required fields, applies defaults explicitly, and throws useful errors for invalid user config. |
| Types | Matches Home Assistant entity/service shapes without broad `any`; use repo conventions for shared types. |
| Editor | Updates config with `config-changed`, keeps existing controls and localization style, and avoids mutating unrelated config. |
| Translations | Keeps key names stable, removes unused new keys from all locales, and preserves existing fallback behavior. |
| HACS/build | Produces the expected module file and keeps resource URL/install docs aligned with release assets. |

## Validation

Run scripts that the repo already defines. Common commands are:

```text
npm test
npm run lint
npm run build
```

Use the actual package manager and scripts already configured. Run translation checks only when the repo defines one. Do not add a test framework or formatter just to satisfy validation. For dependency changes in public repos, check that lockfiles and package-manager config do not gain private or machine-local registry URLs.

## Scaffolding

For a new card, start with the smallest working custom element and resource registration. Add an editor, translations, HACS metadata, screenshots, bundling, or release automation only when requested or already part of the repo pattern.

Do not hard-code one framework as required. Lit is a common choice, but a custom card only needs to be a valid custom element loaded as a JavaScript module.
