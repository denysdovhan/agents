---
name: fuel-prices-ua
description: Get fuel prices from Ukrainian gas station chains. Use when the user asks for current prices of gasoline, diesel, premium diesel, or LPG at OKKO, WOG, or SOCAR, or wants a quick comparison between these networks.
---

# Fuel Prices UA

Use this skill to fetch current fuel prices from Ukrainian gas station chains.

## Supported networks

- OKKO
- WOG
- SOCAR

## Workflow

1. Prefer direct network sources over third-party aggregators.
2. For WOG, open `https://wog.ua/ua/fuels/` and read the on-page fuel tiles.
3. For OKKO, if normal page extraction is blocked, request `https://okko.ua/fuel` and parse the embedded page data for fuel codes and prices.
4. For SOCAR, first try the official fuel page or site search. If the public page is JS-heavy, inspect page data or official JSON/XHR endpoints before falling back to a reputable third-party source.
5. When the user asks for premium diesel, map the network names correctly:
   - OKKO: `PULLS Diesel` / `DP Pulls`
   - WOG: `Mustang Diesel`
   - SOCAR: premium diesel naming may differ, verify from the source before answering
6. Also capture the regular diesel price when it is easy to read, because it helps comparison.
7. Report prices in Ukrainian, briefly and clearly.

## Extraction notes

### WOG

- The WOG fuels page exposes price tiles in the rendered page.
- Look for labels like `ДП Mustang` and `ДП Євро5`.
- Current examples are shown as compact tiles, so accessibility snapshots often work well.

### OKKO

- OKKO may show anti-bot or Imperva pages in browser mode.
- If that happens, use direct HTTP fetch against `https://okko.ua/fuel`.
- Search the response for serialized price objects and fuel codes.
- Useful mappings:
  - `fuel_code:"DP"` = regular diesel
  - `Pulls_Diesel:"DP Pulls"` and `fuel_code:A` = premium diesel (`PULLS Diesel`)
- Confirm the premium diesel price by matching the `DP Pulls` label to the serialized price entry.

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

WOG
- Mustang Diesel: 95.90 грн/л
- ДП Євро5: 92.90 грн/л
```

If one network cannot be verified from an official source, say that explicitly.

## Guardrails

- Do not guess prices.
- Do not mix old cached prices with live ones without saying so.
- Prefer same-day official prices when available.
- If extraction is blocked or ambiguous, say which network is blocked and why.
