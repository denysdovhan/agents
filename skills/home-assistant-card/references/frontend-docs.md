# Frontend Docs Routing

Use this file before changing Home Assistant custom card APIs, card editor behavior, dashboard resource registration, frontend data access, or external app integration behavior. All doc paths below are relative to the [Home Assistant developers docs base](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/) — prepend it when fetching:

```text
https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/
```

Fetch current markdown before coding.

## Source Map

| Task | Doc path |
|---|---|
| Custom card API, card editors, picker registration, suggestions, form editors, sizing | `frontend/custom-ui/custom-card.md` |
| Home Assistant frontend data, methods, entity state access, formatting, localization | `frontend/data.md` |
| Dashboard resource registration and cache/version expectations | `frontend/custom-ui/registering-resources.md` |
| External authentication from a companion app or external page | `frontend/external-authentication.md` |
| External bus messaging with Home Assistant frontend | `frontend/external-bus.md` |

## Read Rules

- Read `custom-card.md` for any change touching `setConfig`, `hass`, `getCardSize`, `getGridOptions`, `getConfigElement`, `getConfigForm`, `getStubConfig`, `window.customCards`, card picker suggestions, or editor `config-changed` events.
- Read `data.md` when reading entity state, formatting values, using `hass.localize`, comparing state objects, or subscribing to Home Assistant contexts.
- Read `registering-resources.md` when changing README installation instructions, HACS output names, bundle filenames, resource URLs, or cache-busting advice.
- Read external authentication or external bus docs only for cards that intentionally interact with Home Assistant from outside the normal dashboard module runtime.

Use `card-examples.md` for compact, adapted examples of the APIs above. Treat those examples as starting points; fetch the current docs before implementing.
