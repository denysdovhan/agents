# Home Assistant Quality Rules Reference

Doc paths below are relative to the docs base URL defined in `SKILL.md` (`https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/`). Each rule's doc lives at `core/integration-quality-scale/rules/<rule>.md` under that base. Fetch the current markdown for a rule before applying it.

The authoritative, machine-readable rule list per tier is `core/integration-quality-scale/_includes/tiers.json`. Fetch it at the start of any quality review; if it disagrees with the table below, trust `tiers.json`. Do not fetch `core/integration-quality-scale/rules.md` or `checklist.md` as raw markdown — they are JSX shells with no rule content; their rendered pages are for human reading only.

Default to Bronze. Higher levels are cumulative and should only be added when the user asks or explicitly accepts the extra scope.

| Level | Rule | Requirement |
|---|---|---|
| Bronze | `action-setup` | Service actions are registered in `async_setup`. |
| Bronze | `appropriate-polling` | Polling integrations set an appropriate polling interval. |
| Bronze | `brands` | Branding assets exist for the integration. |
| Bronze | `common-modules` | Common patterns live in common modules. |
| Bronze | `config-flow-test-coverage` | Config flow has full test coverage. |
| Bronze | `config-flow` | Integration can be set up via the UI. |
| Bronze | `dependency-transparency` | Dependencies are transparent. |
| Bronze | `docs-actions` | Docs describe provided service actions. |
| Bronze | `docs-conditions` | Docs describe provided automation conditions. |
| Bronze | `docs-high-level-description` | Docs include a high-level brand, product, or service description. |
| Bronze | `docs-installation-instructions` | Docs provide step-by-step installation instructions. |
| Bronze | `docs-removal-instructions` | Docs provide removal instructions. |
| Bronze | `docs-triggers` | Docs describe provided automation triggers. |
| Bronze | `entity-event-setup` | Entity events are subscribed in correct lifecycle methods. |
| Bronze | `entity-unique-id` | Entities have unique IDs. |
| Bronze | `has-entity-name` | Entities use `has_entity_name = True`. |
| Bronze | `runtime-data` | Runtime objects are stored on `ConfigEntry.runtime_data`. |
| Bronze | `test-before-configure` | Connection is tested in config flow. |
| Bronze | `test-before-setup` | Setup checks that the integration can initialize correctly. |
| Bronze | `unique-config-entry` | Duplicate setup for the same device or service is prevented. |
| Silver | `action-exceptions` | Service actions raise exceptions on failures. |
| Silver | `config-entry-unloading` | Config entry unloading is supported. |
| Silver | `docs-configuration-parameters` | Docs describe all integration configuration options. |
| Silver | `docs-installation-parameters` | Docs describe all installation parameters. |
| Silver | `entity-unavailable` | Entities are marked unavailable when appropriate. |
| Silver | `integration-owner` | Integration has an owner. |
| Silver | `log-when-unavailable` | Unavailability and recovery are logged once each. |
| Silver | `parallel-updates` | Number of parallel updates is specified. |
| Silver | `reauthentication-flow` | Reauthentication is available via UI. |
| Silver | `test-coverage` | Integration modules have above 95% test coverage. |
| Gold | `devices` | Integration creates devices. |
| Gold | `diagnostics` | Integration implements diagnostics. |
| Gold | `discovery-update-info` | Discovery info updates network information. |
| Gold | `discovery` | Devices can be discovered. |
| Gold | `docs-data-update` | Docs describe how data is updated. |
| Gold | `docs-examples` | Docs provide automation examples. |
| Gold | `docs-known-limitations` | Docs describe known limitations. |
| Gold | `docs-supported-devices` | Docs describe supported and unsupported devices. |
| Gold | `docs-supported-functions` | Docs describe supported functionality, entities, and platforms. |
| Gold | `docs-troubleshooting` | Docs provide troubleshooting information. |
| Gold | `docs-use-cases` | Docs describe use cases. |
| Gold | `dynamic-devices` | Devices added after setup are handled. |
| Gold | `entity-category` | Entities have appropriate `EntityCategory`. |
| Gold | `entity-device-class` | Entities use device classes where possible. |
| Gold | `entity-disabled-by-default` | Less popular or noisy entities are disabled by default. |
| Gold | `entity-translations` | Entities have translated names. |
| Gold | `exception-translations` | Exception messages are translatable. |
| Gold | `icon-translations` | Entities implement icon translations. |
| Gold | `reconfiguration-flow` | Integration has a reconfigure flow. |
| Gold | `repair-issues` | Repair issues or flows are used when intervention is needed. |
| Gold | `stale-devices` | Stale devices are removed. |
| Platinum | `async-dependency` | Dependency is async. |
| Platinum | `inject-websession` | Dependency supports passing in a websession. |
| Platinum | `strict-typing` | Integration uses strict typing. |
