# Home Assistant Architecture Reference

Use this file before editing generic integration architecture. Fetch the current markdown from the linked source before coding.

## Core Architecture

| Topic | Markdown Source |
|---|---|
| Core architecture | [`architecture/core.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/architecture/core.md) |
| Integration/component architecture | [`architecture_components.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/architecture_components.md) |
| The `hass` object | [`dev_101_hass.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/dev_101_hass.md) |
| Events basics | [`dev_101_events.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/dev_101_events.md) |
| Services basics | [`dev_101_services.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/dev_101_services.md) |
| States basics | [`dev_101_states.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/dev_101_states.md) |

## Integration Structure

| Topic | Markdown Source |
|---|---|
| File structure | [`creating_integration_file_structure.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_integration_file_structure.md) |
| Manifest | [`creating_integration_manifest.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_integration_manifest.md) |
| Brand assets | [`core/integration/brand_images.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/brand_images.md) |
| Config entries index | [`config_entries_index.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/config_entries_index.md) |
| Config flow | [`core/integration/config_flow.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/config_flow.md) |
| Options flow | [`core/integration/options_flow.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/options_flow.md) |
| YAML configuration | [`core/integration/yaml_configuration.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/yaml_configuration.md) |

For local file-level routing, read `core-integration-files.md` before editing integration files such as `__init__.py`, `manifest.json`, `config_flow.py`, `coordinator.py`, `diagnostics.py`, or `repairs.py`.

## Runtime Behavior

| Topic | Markdown Source |
|---|---|
| Fetching data | [`integration_fetching_data.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/integration_fetching_data.md) |
| Setup failures | [`integration_setup_failures.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/integration_setup_failures.md) |
| Firing events | [`integration_events.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/integration_events.md) |
| Listening for events | [`integration_listen_events.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/integration_listen_events.md) |
| Networking and discovery | [`network_discovery.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/network_discovery.md) |
| Diagnostics | [`core/integration/diagnostics.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/diagnostics.md) |
| System health | [`core/integration/system_health.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/integration/system_health.md) |
| Authentication | [`auth_index.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/auth_index.md) |

## Project Hygiene

| Topic | Markdown Source |
|---|---|
| Component code review | [`creating_component_code_review.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_component_code_review.md) |
| Platform code review | [`creating_platform_code_review.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_platform_code_review.md) |
| Test file structure | [`creating_integration_tests_file_structure.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_integration_tests_file_structure.md) |
| Development testing | [`development_testing.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/development_testing.md) |
| Typing | [`development_typing.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/development_typing.md) |
| Translations | [`translations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/translations.md) |
| Internationalization | [`internationalization.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/internationalization.md) |
| Documentation | [`documenting.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/documenting.md) |

## Editing Rule

When editing architecture-level files, read this reference, fetch the relevant markdown sources, then inspect the local repo implementation before changing code. Do not infer current Home Assistant requirements from memory.
