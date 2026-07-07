# Home Assistant Entities And Domains Reference

Use this file before editing platform/entity files or deciding which Home Assistant platform domain should represent a feature. Doc paths below are relative to the docs base URL defined in `SKILL.md` (`https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/`) — prepend it and fetch the current markdown before coding.

Always read the generic entity docs plus the platform-specific docs for any file being edited:

- `core/entity.md`
- `creating_platform_code_review.md`

## Platform File Map

The platform file is usually `<domain>.py`. Platform docs live under `core/entity/` — note the file names use dashes while domains use underscores, and a few do not match exactly.

| Platform domain | Doc path under `core/entity/` |
|---|---|
| `ai_task` | `ai-task.md` |
| `air_quality` | `air-quality.md` |
| `alarm_control_panel` | `alarm-control-panel.md` |
| `assist_satellite` | `assist-satellite.md` |
| `binary_sensor` | `binary-sensor.md` |
| `button` | `button.md` |
| `calendar` | `calendar.md` |
| `camera` | `camera.md` |
| `climate` | `climate.md` |
| `conversation` | `conversation.md` |
| `cover` | `cover.md` |
| `date` | `date.md` |
| `datetime` | `datetime.md` |
| `device_tracker` | `device-tracker.md` |
| `event` | `event.md` |
| `fan` | `fan.md` |
| `humidifier` | `humidifier.md` |
| `image` | `image.md` |
| `infrared` | `infrared.md` |
| `lawn_mower` | `lawn-mower.md` |
| `light` | `light.md` |
| `lock` | `lock.md` |
| `media_player` | `media-player.md` |
| `notify` | `notify.md` |
| `number` | `number.md` |
| `radio_frequency` | `radio-frequency.md` |
| `remote` | `remote.md` |
| `scene` | `scene.md` |
| `select` | `select.md` |
| `sensor` | `sensor.md` |
| `siren` | `siren.md` |
| `stt` | `stt.md` |
| `switch` | `switch.md` |
| `text` | `text.md` |
| `time` | `time.md` |
| `todo` | `todo.md` |
| `tts` | `tts.md` |
| `update` | `update.md` |
| `vacuum` | `vacuum.md` |
| `valve` | `valve.md` |
| `wake_word` | `wake_word.md` |
| `water_heater` | `water-heater.md` |
| `weather` | `weather.md` |

## Domain-Level Files

For integration-level files such as `__init__.py`, `manifest.json`, `config_flow.py`, `coordinator.py`, `diagnostics.py`, `repairs.py`, translations, services, tests, and docs, read `core-integration-files.md`.
