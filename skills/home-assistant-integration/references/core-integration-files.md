# Home Assistant Core Integration Files Reference

Use this file before editing integration-level files. Doc paths below are relative to the docs base URL defined in `SKILL.md` (`https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/`) — prepend it and fetch the current markdown before coding, then inspect the local repo patterns. Quality-rule docs live at `core/integration-quality-scale/rules/<rule>.md`.

## File Map

| Local file or area | Read before editing |
|---|---|
| `__init__.py` | `architecture_components.md`, `config_entries_index.md`, `integration_setup_failures.md`, `integration_fetching_data.md` |
| `manifest.json` | `creating_integration_manifest.md`, `creating_integration_file_structure.md`, `core/integration/brand_images.md` |
| `config_flow.py` | `core/integration/config_flow.md`, `data_entry_flow_index.md`, `config_entries_index.md`, `auth_index.md`, `network_discovery.md` |
| `options_flow.py` | `core/integration/options_flow.md`, `config_entries_index.md` |
| `coordinator.py` | `integration_fetching_data.md`, `integration_setup_failures.md`, `asyncio_working_with_async.md`, `asyncio_blocking_operations.md` |
| `entity.py` | `core/entity.md`, `creating_platform_code_review.md`, `entities-and-domains.md` |
| Platform modules | `entities-and-domains.md`, `core/entity.md`, `creating_platform_code_review.md` |
| `diagnostics.py` | `core/integration/diagnostics.md`, rule `diagnostics` |
| `repairs.py` | rule `repair-issues`, `translations.md` |
| `services.yaml` and service/action handlers | `dev_101_services.md`, rules `action-setup`, `action-exceptions`, `docs-actions` |
| `strings.json`, `translations/*.json` | `translations.md`, `internationalization.md`, rules `entity-translations`, `exception-translations`, `icon-translations` |
| API/client modules | `integration_fetching_data.md`, `asyncio_working_with_async.md`, `asyncio_blocking_operations.md`, `auth_index.md` |
| `tests/` | `creating_integration_tests_file_structure.md`, `development_testing.md`, rules `config-flow-test-coverage`, `test-coverage` |
| User docs / README | `documenting.md`, quality docs rules in `quality-rules.md` |

`entities-and-domains.md` and `quality-rules.md` refer to the reference files in this skill, not upstream docs.

## Editing Rule

When a file maps to multiple sources, fetch only the sources that match the actual change. For example, a `config_flow.py` change involving discovery should include `network_discovery.md`; a simple schema wording update should usually include config flow and translations docs only.
