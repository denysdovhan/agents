# Card Examples

Use these compact examples when creating a card, adding a visual editor, or reviewing card picker behavior. They are adapted from Home Assistant's custom card and frontend data docs; fetch the current docs before implementing.

Sources (paths relative to the docs base URL in `frontend-docs.md`):

- `frontend/custom-ui/custom-card.md`
- `frontend/data.md`

## Minimal Card Shape

```js
class ExampleStatusCard extends HTMLElement {
  setConfig(config) {
    if (!config.entity) {
      throw new Error("entity is required");
    }
    this._config = config;
  }

  set hass(hass) {
    this._hass = hass;
    this._render();
  }

  _render() {
    const stateObj = this._hass?.states[this._config.entity];
    this.innerHTML = `
      <ha-card>
        <div class="card-content">
          ${stateObj ? this._hass.formatEntityState(stateObj) : "Unavailable"}
        </div>
      </ha-card>
    `;
  }

  getCardSize() {
    return 2;
  }

  getGridOptions() {
    return { rows: 2, columns: 6, min_rows: 2 };
  }
}

customElements.define("example-status-card", ExampleStatusCard);
```

Register it as `type: custom:example-status-card` and load the bundled JavaScript as a dashboard resource with `type: module`.

## Built-In Form Editor Schema

Use `getConfigForm()` when the visual editor can be described by Home Assistant selectors instead of a custom editor element.

```js
class ExampleStatusCard extends HTMLElement {
  static getConfigForm() {
    return {
      schema: [
        { name: "entity", required: true, selector: { entity: {} } },
        {
          name: "name",
          selector: { entity_name: {} },
          context: { entity: "entity" },
        },
        {
          type: "grid",
          name: "",
          schema: [
            {
              name: "icon",
              selector: { icon: {} },
              context: { icon_entity: "entity" },
            },
            { name: "state_color", selector: { boolean: {} } },
            { name: "unit", selector: { text: {} } },
            { name: "theme", selector: { theme: {} } },
          ],
        },
      ],
      computeLabel: (schema) =>
        schema.name === "state_color" ? "Use state color" : undefined,
      computeHelper: (schema) =>
        schema.name === "entity" ? "Entity displayed by this card" : undefined,
      assertConfig: (config) => {
        if (typeof config.entity !== "string") {
          throw new Error("entity must be a string");
        }
      },
    };
  }
}
```

Schema notes:

- Use selectors such as `entity`, `entity_name`, `icon`, `attribute`, `theme`, `boolean`, and `text`.
- Use `context` when one selector depends on another field, for example an icon or attribute selector filtered by `entity`.
- Use `type: "grid"` or `type: "expandable"` for grouped fields.
- Throw from `assertConfig` only when the YAML shape cannot be represented safely by the form editor.

## Custom Editor Element

Use `getConfigElement()` when schema forms are not expressive enough.

```js
class ExampleStatusCard extends HTMLElement {
  static getConfigElement() {
    return document.createElement("example-status-card-editor");
  }

  static getStubConfig() {
    return { entity: "sun.sun" };
  }
}

class ExampleStatusCardEditor extends HTMLElement {
  setConfig(config) {
    this._config = config;
  }

  _updateConfig(patch) {
    const config = { ...this._config, ...patch };
    this.dispatchEvent(
      new CustomEvent("config-changed", {
        bubbles: true,
        composed: true,
        detail: { config },
      }),
    );
  }
}

customElements.define("example-status-card-editor", ExampleStatusCardEditor);
```

## Card Picker Entry And Entity Suggestion

```js
window.customCards = window.customCards || [];
window.customCards.push({
  type: "example-status-card",
  name: "Example Status Card",
  description: "Display one entity state.",
  preview: false,
  documentationURL:
    "https://developers.home-assistant.io/docs/frontend/custom-ui/custom-card",
  getEntitySuggestion: (hass, entityId) => {
    const stateObj = hass.states[entityId];
    if (!stateObj || entityId.split(".")[0] !== "sensor") {
      return null;
    }
    return {
      config: { type: "custom:example-status-card", entity: entityId },
    };
  },
});
```

Only suggest a card for domains or capabilities the card actually supports.
