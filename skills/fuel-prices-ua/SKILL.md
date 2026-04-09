---
name: fuel-prices-ua
description: Get fuel prices from Ukrainian gas station chains. Use when the user asks for current prices of gasoline, diesel, premium diesel, regular diesel, LPG, or other fuel types at OKKO, WOG, or SOCAR, or wants a quick comparison between these networks.
---

# Fuel Prices UA

Use this skill to fetch current fuel prices from Ukrainian gas station chains across both premium and regular fuel lines.

## Supported networks

- OKKO
- WOG
- SOCAR

## Workflow

1. Prefer direct network sources over third-party aggregators.
2. For WOG, open `https://wog.ua/ua/fuels/` and read the on-page fuel tiles.
3. For OKKO, if normal page extraction is blocked, request `https://okko.ua/fuel` and parse the embedded page data for fuel codes and prices.
4. For SOCAR, first try the official fuel page or site search. If the public page is JS-heavy, inspect page data or official JSON/XHR endpoints before falling back to a reputable third-party source.
5. Map branded and regular fuels correctly before answering.
6. When available, collect the full visible fuel board for each network, not just one product.
7. Report prices in Ukrainian, briefly and clearly.

## Fuel mapping

### OKKO

- `fuel_code:"DP"` = regular diesel
- `Pulls_Diesel:"DP Pulls"` plus `fuel_code:A` = premium diesel (`PULLS Diesel`)
- `fuel_code:"A-95"` = regular A-95 gasoline
- `fuel_code:C` = premium gasoline (`PULLS 95`)
- `fuel_code:z` = premium gasoline (`PULLS 100`)
- `fuel_code:"SPBT"` = LPG / gas
- `fuel_code:D` = AdBlue, not automotive fuel for normal price comparisons

### WOG

Read the on-page labels directly. Typical visible products include:
- `ДП Mustang` = premium diesel
- `ДП Євро5` = regular diesel
- `95 Mustang` = premium A-95
- `95 Євро5-Е5` = regular A-95
- `100 Mustang` = premium 100 gasoline
- `ГАЗ` = LPG

### SOCAR

- Verify product names from the official SOCAR Ukraine source at run time.
- Distinguish regular fuels from branded lines like `Nano` before answering.

## Extraction notes

### WOG

- The WOG fuels page exposes price tiles in the rendered page.
- Look for labels like `ДП Mustang`, `ДП Євро5`, `95 Mustang`, `95 Євро5-Е5`, `100 Mustang`, and `ГАЗ`.
- Current examples are shown as compact tiles, so accessibility snapshots often work well.

### OKKO

- OKKO may show anti-bot or Imperva pages in browser mode.
- If that happens, use direct HTTP fetch against `https://okko.ua/fuel`.
- Search the response for serialized price objects and fuel codes.
- Useful mappings are listed in the Fuel mapping section above.
- Confirm each price by matching the serialized code or label to the visible fuel lineup.
- For broader comparisons, extract regular gasoline, premium gasoline, diesel, premium diesel, and LPG when present.

### SOCAR

- Prefer official SOCAR Ukraine pages.
- Look for `Nano` / branded fuel names and diesel labels.
- If the site hides prices behind JS, inspect HTML, embedded JSON, or official API calls before using anything else.

## Output format

Use a compact comparison like this:

```text
OKKO
- PULLS Diesel: 95.90 грн/л
- ДП Євро: 92.90 грн/л
- PULLS 95: 79.90 грн/л
- A-95 Євро: 76.90 грн/л
- ГАЗ: 49.90 грн/л

WOG
- ДП Mustang: 95.90 грн/л
- ДП Євро5: 92.90 грн/л
- 95 Mustang: 79.90 грн/л
- 95 Євро5-Е5: 76.90 грн/л
- 100 Mustang: 86.90 грн/л
- ГАЗ: 49.90 грн/л
```

If one network cannot be verified from an official source, say that explicitly.

## Guardrails

- Do not guess prices.
- Do not mix old cached prices with live ones without saying so.
- Prefer same-day official prices when available.
- If extraction is blocked or ambiguous, say which network is blocked and why.
- If some fuel types are present on one network but not another, say that explicitly instead of inventing a direct comparison.
