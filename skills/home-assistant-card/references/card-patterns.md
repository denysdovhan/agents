# Card Patterns

Use this file before changing card runtime behavior, card editors, picker metadata, service calls, or entity rendering.

## Config And State

- Implement `setConfig(config)` for user configuration. Validate required fields and throw `Error` for invalid config so Home Assistant can render an error card.
- Treat defaulting as explicit card behavior. A helper such as `buildConfig` is fine when it already exists or reduces duplication, but it is not required.
- Use the `hass` object passed by Home Assistant. Read entity state from `hass.states`, call services through `hass.callService`, and use Home Assistant/local formatting helpers when the repo has them.
- Avoid module-level mutable state for card-specific config or entity state. Multiple card instances can exist on one dashboard.

## Rendering

- Render from current `hass` and config. Do not cache entity state in a way that skips Home Assistant updates.
- Guard every optional entity, attribute, and service capability. A missing or unavailable entity should render a clear unavailable state, not throw during dashboard render.
- Keep loading and in-progress indicators tied to actual async operation state. Clear the indicator on both success and failure.
- Preserve existing CSS scoping, host sizing, and theme variable usage.
- Keep render methods pure where the framework expects it. Do service calls, event dispatch, timers, and subscriptions from handlers or lifecycle hooks.

## Editors

- Use `getConfigElement()` for a custom visual editor or `getConfigForm()` for Home Assistant's built-in form editor when the config is simple enough.
- Prefer `getConfigForm()` for simple editors that can be expressed as a Home Assistant form schema. See `card-examples.md` for selector, grid, context, helper, and validation examples.
- The editor's `setConfig` receives the current config. Keep a local copy and emit the whole updated config on changes.
- Dispatch `config-changed` with `bubbles: true`, `composed: true`, and `detail: { config }`. Use a repo helper if one exists.
- Preserve unknown config keys unless the editor intentionally owns the full config shape.
- Localize editor labels with the repo's existing translation pattern.

## Picker And Suggestions

- Add `window.customCards` metadata when the card should appear in the picker. Keep `type`, `name`, `description`, preview, and documentation URL aligned with docs.
- Keep descriptions short and user-facing. Do not expose implementation details in picker text.
- Use `getEntitySuggestion` only when the selected entity is genuinely supported. Return `null` for unsupported domains or capabilities; suggesting a card for every entity makes the picker noisy.
- Keep `getStubConfig` small, valid, and easy to edit.

## Services And Entity Features

- Preserve `entity_id`, `target`, and `service_data` semantics from Home Assistant service calls.
- Check `supported_features`, device class, units, attributes, and domain before rendering controls that may not apply.
- Prefer Home Assistant formatting/localization helpers over hand-built strings when displaying state, dates, durations, percentages, and units.
