---
name: home-assistant-integration
description: Use this skill when creating, scaffolding, reviewing, or maintaining Python Home Assistant custom integrations, including work on custom_components, manifests, config flows, options flows, config entries, platforms/entities, DataUpdateCoordinator, diagnostics, repairs, discovery/networking, authentication, HACS-ready repositories, or Home Assistant integration quality scale compliance.
---

# Home Assistant Integration Skill

Use this skill for Home Assistant custom integration development. This is separate from Home Assistant automation, helper, script, and Lovelace work.

## Start With Current Docs

Fetch the latest markdown from the Home Assistant developers docs repository before coding. Prefer raw files from:

```text
https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/
```

Use rendered pages on `developers.home-assistant.io` only as secondary reading. Do not copy Home Assistant docs into generated skill or repo files. Fetch only the files relevant to the task.

Common source files:

| Task | Markdown files |
|---|---|
| Architecture | `architecture/core.md`, `architecture_components.md` |
| File layout and manifest | `creating_integration_file_structure.md`, `creating_integration_manifest.md` |
| Config lifecycle | `core/integration/config_flow.md`, `core/integration/options_flow.md`, `config_entries_index.md`, `integration_setup_failures.md` |
| Runtime behavior | `integration_fetching_data.md`, `integration_events.md`, `integration_listen_events.md`, `network_discovery.md`, `dev_101_hass.md`, `core/entity.md` |
| Diagnostics, auth, branding | `core/integration/diagnostics.md`, `auth_index.md`, `core/integration/brand_images.md` |
| Review gates | `creating_component_code_review.md`, `creating_platform_code_review.md`, `core/integration-quality-scale/rules.md`, `core/integration-quality-scale/checklist.md` |
| Quality rules | `core/integration-quality-scale/rules/<rule>.md` for each rule that applies |

For quality scale work, always fetch `rules.md`, `checklist.md`, and every referenced rule file before deciding whether a rule is satisfied. The table below is a cached checklist, not a substitute for fetching current markdown.

## Local Workflow

1. Inspect local instructions first: `AGENTS.md`, scripts, `pyproject.toml`, workflows, README files, and existing `custom_components/<domain>` files.
2. Preserve repo conventions. Prefer existing user Home Assistant repo patterns: `uv` tooling, `scripts/lint`, `scripts/test`, typed runtime data, `DataUpdateCoordinator`, config flows, diagnostics, translations, and minimal diffs.
3. Keep API/client code Home Assistant agnostic where the repo already separates it from integration code.
4. Use config entries and UI setup by default for real integrations. Use YAML only when the user explicitly asks or the existing repo still requires it.
5. Keep entities cheap: no I/O in entity properties; update cached values through setup, coordinator refreshes, or event callbacks.
6. Use `ConfigEntry.runtime_data` for runtime objects when adding or reshaping integration state.
7. Handle setup failures with the Home Assistant exceptions that match the failure: retryable setup failures, auth failures, and permanent invalid configuration should not be conflated.
8. Add tests for changed behavior. Run the repo scripts requested by local instructions, usually `scripts/lint` after Python changes and `scripts/test` before finishing.
9. When behavior is unclear, add narrow debug logging or ask for logs instead of guessing.

## Scaffolding Guidance

When scaffolding a new integration from an existing user repo, copy structure and tooling style, then remove business logic that does not belong to the new integration. Keep only the integration basics needed for setup, manifest validity, importability, testability, and future feature work.

Minimum shape for a custom integration is usually:

```text
custom_components/<domain>/
  __init__.py
  manifest.json
```

Add files such as `config_flow.py`, platform modules, `coordinator.py`, `entity.py`, `diagnostics.py`, `repairs.py`, translations, tests, and brand assets only when required by the requested scope or the selected quality target.

## Quality Scale

Default to Bronze. Higher levels are cumulative and should only be added when the user asks or explicitly accepts the extra scope. Bronze means all Bronze rules apply; Silver includes Bronze; Gold includes Silver and Bronze; Platinum includes all lower levels.

Before finishing ordinary integration work, run the Bronze checklist against the current code. If the user asks for Silver, Gold, or Platinum, make the additional rule set part of the implementation scope before coding.

| Level | Rule | Requirement | Markdown Source |
|---|---|---|---|
| Bronze | `action-setup` | Service actions are registered in `async_setup`. | [`rules/action-setup.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/action-setup.md) |
| Bronze | `appropriate-polling` | Polling integrations set an appropriate polling interval. | [`rules/appropriate-polling.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/appropriate-polling.md) |
| Bronze | `brands` | Branding assets exist for the integration. | [`rules/brands.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/brands.md) |
| Bronze | `common-modules` | Common patterns live in common modules. | [`rules/common-modules.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/common-modules.md) |
| Bronze | `config-flow-test-coverage` | Config flow has full test coverage. | [`rules/config-flow-test-coverage.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/config-flow-test-coverage.md) |
| Bronze | `config-flow` | Integration can be set up via the UI. | [`rules/config-flow.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/config-flow.md) |
| Bronze | `dependency-transparency` | Dependencies are transparent. | [`rules/dependency-transparency.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/dependency-transparency.md) |
| Bronze | `docs-actions` | Docs describe provided service actions. | [`rules/docs-actions.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-actions.md) |
| Bronze | `docs-high-level-description` | Docs include a high-level brand, product, or service description. | [`rules/docs-high-level-description.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-high-level-description.md) |
| Bronze | `docs-installation-instructions` | Docs provide step-by-step installation instructions. | [`rules/docs-installation-instructions.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-installation-instructions.md) |
| Bronze | `docs-removal-instructions` | Docs provide removal instructions. | [`rules/docs-removal-instructions.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-removal-instructions.md) |
| Bronze | `entity-event-setup` | Entity events are subscribed in correct lifecycle methods. | [`rules/entity-event-setup.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-event-setup.md) |
| Bronze | `entity-unique-id` | Entities have unique IDs. | [`rules/entity-unique-id.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-unique-id.md) |
| Bronze | `has-entity-name` | Entities use `has_entity_name = True`. | [`rules/has-entity-name.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/has-entity-name.md) |
| Bronze | `runtime-data` | Runtime objects are stored on `ConfigEntry.runtime_data`. | [`rules/runtime-data.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/runtime-data.md) |
| Bronze | `test-before-configure` | Connection is tested in config flow. | [`rules/test-before-configure.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/test-before-configure.md) |
| Bronze | `test-before-setup` | Setup checks that the integration can initialize correctly. | [`rules/test-before-setup.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/test-before-setup.md) |
| Bronze | `unique-config-entry` | Duplicate setup for the same device or service is prevented. | [`rules/unique-config-entry.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/unique-config-entry.md) |
| Silver | `action-exceptions` | Service actions raise exceptions on failures. | [`rules/action-exceptions.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/action-exceptions.md) |
| Silver | `config-entry-unloading` | Config entry unloading is supported. | [`rules/config-entry-unloading.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/config-entry-unloading.md) |
| Silver | `docs-configuration-parameters` | Docs describe all integration configuration options. | [`rules/docs-configuration-parameters.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-configuration-parameters.md) |
| Silver | `docs-installation-parameters` | Docs describe all installation parameters. | [`rules/docs-installation-parameters.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-installation-parameters.md) |
| Silver | `entity-unavailable` | Entities are marked unavailable when appropriate. | [`rules/entity-unavailable.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-unavailable.md) |
| Silver | `integration-owner` | Integration has an owner. | [`rules/integration-owner.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/integration-owner.md) |
| Silver | `log-when-unavailable` | Unavailability and recovery are logged once each. | [`rules/log-when-unavailable.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/log-when-unavailable.md) |
| Silver | `parallel-updates` | Number of parallel updates is specified. | [`rules/parallel-updates.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/parallel-updates.md) |
| Silver | `reauthentication-flow` | Reauthentication is available via UI. | [`rules/reauthentication-flow.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/reauthentication-flow.md) |
| Silver | `test-coverage` | Integration modules have above 95% test coverage. | [`rules/test-coverage.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/test-coverage.md) |
| Gold | `devices` | Integration creates devices. | [`rules/devices.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/devices.md) |
| Gold | `diagnostics` | Integration implements diagnostics. | [`rules/diagnostics.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/diagnostics.md) |
| Gold | `discovery-update-info` | Discovery info updates network information. | [`rules/discovery-update-info.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/discovery-update-info.md) |
| Gold | `discovery` | Devices can be discovered. | [`rules/discovery.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/discovery.md) |
| Gold | `docs-data-update` | Docs describe how data is updated. | [`rules/docs-data-update.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-data-update.md) |
| Gold | `docs-examples` | Docs provide automation examples. | [`rules/docs-examples.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-examples.md) |
| Gold | `docs-known-limitations` | Docs describe known limitations. | [`rules/docs-known-limitations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-known-limitations.md) |
| Gold | `docs-supported-devices` | Docs describe supported and unsupported devices. | [`rules/docs-supported-devices.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-supported-devices.md) |
| Gold | `docs-supported-functions` | Docs describe supported functionality, entities, and platforms. | [`rules/docs-supported-functions.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-supported-functions.md) |
| Gold | `docs-troubleshooting` | Docs provide troubleshooting information. | [`rules/docs-troubleshooting.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-troubleshooting.md) |
| Gold | `docs-use-cases` | Docs describe use cases. | [`rules/docs-use-cases.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/docs-use-cases.md) |
| Gold | `dynamic-devices` | Devices added after setup are handled. | [`rules/dynamic-devices.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/dynamic-devices.md) |
| Gold | `entity-category` | Entities have appropriate `EntityCategory`. | [`rules/entity-category.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-category.md) |
| Gold | `entity-device-class` | Entities use device classes where possible. | [`rules/entity-device-class.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-device-class.md) |
| Gold | `entity-disabled-by-default` | Less popular or noisy entities are disabled by default. | [`rules/entity-disabled-by-default.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-disabled-by-default.md) |
| Gold | `entity-translations` | Entities have translated names. | [`rules/entity-translations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/entity-translations.md) |
| Gold | `exception-translations` | Exception messages are translatable. | [`rules/exception-translations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/exception-translations.md) |
| Gold | `icon-translations` | Entities implement icon translations. | [`rules/icon-translations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/icon-translations.md) |
| Gold | `reconfiguration-flow` | Integration has a reconfigure flow. | [`rules/reconfiguration-flow.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/reconfiguration-flow.md) |
| Gold | `repair-issues` | Repair issues or flows are used when intervention is needed. | [`rules/repair-issues.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/repair-issues.md) |
| Gold | `stale-devices` | Stale devices are removed. | [`rules/stale-devices.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/stale-devices.md) |
| Platinum | `async-dependency` | Dependency is async. | [`rules/async-dependency.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/async-dependency.md) |
| Platinum | `inject-websession` | Dependency supports passing in a websession. | [`rules/inject-websession.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/inject-websession.md) |
| Platinum | `strict-typing` | Integration uses strict typing. | [`rules/strict-typing.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration-quality-scale/rules/strict-typing.md) |

## Review Checklist

Before finishing:

1. Re-fetch relevant docs and quality rule files.
2. Verify the requested quality level, defaulting to Bronze.
3. Run component and platform review checklists relevant to changed files.
4. Confirm config entry setup, unload, runtime data, entity IDs, translations, diagnostics, and tests match the selected scope.
5. Run local validation scripts from the repo instructions.
