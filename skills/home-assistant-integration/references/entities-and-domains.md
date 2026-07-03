# Home Assistant Entities And Domains Reference

Use this file before editing platform/entity files or deciding which Home Assistant platform domain should represent a feature. Fetch the current markdown from the linked source before coding.

Always read the generic entity docs plus the platform-specific docs for any file being edited:

- [`core/entity.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity.md)
- [`creating_platform_code_review.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/creating_platform_code_review.md)

## Platform File Map

The platform file is usually `<domain>.py`; use the domain below to find the matching docs.

| Platform domain | Markdown Source |
|---|---|
| `ai_task` | [`core/entity/ai-task.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/ai-task.md) |
| `air_quality` | [`core/entity/air-quality.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/air-quality.md) |
| `alarm_control_panel` | [`core/entity/alarm-control-panel.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/alarm-control-panel.md) |
| `assist_satellite` | [`core/entity/assist-satellite.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/assist-satellite.md) |
| `binary_sensor` | [`core/entity/binary-sensor.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/binary-sensor.md) |
| `button` | [`core/entity/button.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/button.md) |
| `calendar` | [`core/entity/calendar.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/calendar.md) |
| `camera` | [`core/entity/camera.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/camera.md) |
| `climate` | [`core/entity/climate.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/climate.md) |
| `conversation` | [`core/entity/conversation.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/conversation.md) |
| `cover` | [`core/entity/cover.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/cover.md) |
| `date` | [`core/entity/date.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/date.md) |
| `datetime` | [`core/entity/datetime.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/datetime.md) |
| `device_tracker` | [`core/entity/device-tracker.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/device-tracker.md) |
| `event` | [`core/entity/event.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/event.md) |
| `fan` | [`core/entity/fan.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/fan.md) |
| `humidifier` | [`core/entity/humidifier.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/humidifier.md) |
| `image` | [`core/entity/image.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/image.md) |
| `infrared` | [`core/entity/infrared.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/infrared.md) |
| `lawn_mower` | [`core/entity/lawn-mower.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/lawn-mower.md) |
| `light` | [`core/entity/light.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/light.md) |
| `lock` | [`core/entity/lock.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/lock.md) |
| `media_player` | [`core/entity/media-player.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/media-player.md) |
| `notify` | [`core/entity/notify.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/notify.md) |
| `number` | [`core/entity/number.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/number.md) |
| `radio_frequency` | [`core/entity/radio-frequency.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/radio-frequency.md) |
| `remote` | [`core/entity/remote.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/remote.md) |
| `scene` | [`core/entity/scene.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/scene.md) |
| `select` | [`core/entity/select.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/select.md) |
| `sensor` | [`core/entity/sensor.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/sensor.md) |
| `siren` | [`core/entity/siren.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/siren.md) |
| `stt` | [`core/entity/stt.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/stt.md) |
| `switch` | [`core/entity/switch.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/switch.md) |
| `text` | [`core/entity/text.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/text.md) |
| `time` | [`core/entity/time.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/time.md) |
| `todo` | [`core/entity/todo.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/todo.md) |
| `tts` | [`core/entity/tts.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/tts.md) |
| `update` | [`core/entity/update.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/update.md) |
| `vacuum` | [`core/entity/vacuum.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/vacuum.md) |
| `valve` | [`core/entity/valve.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/valve.md) |
| `wake_word` | [`core/entity/wake_word.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/wake_word.md) |
| `water_heater` | [`core/entity/water-heater.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/water-heater.md) |
| `weather` | [`core/entity/weather.md`](https://raw.githubusercontent.com/home-assistant/developers.home-assistant/master/docs/core/entity/weather.md) |

## Domain-Level Files

For integration-level files such as `__init__.py`, `manifest.json`, `config_flow.py`, `coordinator.py`, `diagnostics.py`, `repairs.py`, translations, services, tests, and docs, read `core-integration-files.md`.
