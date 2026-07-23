# Home Assistant Automation Triggers Reference

Use this file before adding or maintaining integration-provided automation triggers. Fetch the current markdown from the linked source before coding, then inspect local patterns and tests.

## Current Sources

| Topic | Markdown Source | Rendered Source |
|---|---|---|
| Integration trigger classes | [`automations.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/automations.md) | [Trigger class](https://developers.home-assistant.io/docs/automations?_highlight=trigger#trigger-class) |
| Firing events | [`integration_events.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/integration_events.md) | [Firing events](https://developers.home-assistant.io/docs/integration_events/) |

## Routing

For new integration-provided automation triggers, use the current `trigger.py` trigger platform. Do not create `device_trigger.py`; current Home Assistant docs identify device automations as legacy and say new device automations are not accepted.

- `trigger.py`: read `automations.md`; implement trigger classes, validation, attach/remove lifecycle, and registration through `async_get_triggers`.
- `triggers.yaml`: read `automations.md`; define the frontend description for each trigger.
- Event-backed triggers: read `integration_events.md`; ensure attach callbacks unsubscribe cleanly.

## Review Points

When creating or changing triggers, verify:

1. The current docs still allow the `trigger.py` trigger API.
2. Static schemas are defined at module level when required, with dynamic validation only when the static schema cannot express the rule.
3. Attach functions return the unsubscribe callback and avoid I/O in properties or synchronous callbacks.
4. Trigger names, keys, and descriptions follow the current naming guidance from the fetched docs.
5. Tests cover validation, registered trigger classes, attachment, firing behavior, unload cleanup, and trigger descriptions.
