# LG TV MQTT Add-on

Connects your LG WebOS Smart TV to Home Assistant via MQTT with automatic entity discovery.

## Prerequisites

1. Install the **Mosquitto broker** add-on in Home Assistant
2. Enable **LG Connect Apps** on your TV:
   - Go to Settings → Network → LG Connect Apps → Allow

## Installation

1. Add this repository to Home Assistant add-on store
2. Install the **LG TV MQTT** add-on
3. Configure the options below
4. Start the add-on
5. On first run, **accept the pairing prompt on your TV screen**
6. The TV will appear automatically as a `media_player` entity

## Options

| Option | Description | Default |
|---|---|---|
| `tv` | IP address of your LG TV | `192.168.1.180` |
| `name` | MQTT topic prefix and entity name | `livingroom` |
| `mqtt_host` | MQTT broker hostname | `core-mosquitto` |
| `mqtt_port` | MQTT broker port | `1883` |
| `mqtt_user` | MQTT username | _(empty)_ |
| `mqtt_password` | MQTT password | _(empty)_ |

## MQTT Topics

### Status (published by add-on)

| Topic | Description |
|---|---|
| `{name}/connected` | `0` = offline, `1` = MQTT only, `2` = TV connected |
| `{name}/status/volume` | Current volume (0-100) |
| `{name}/status/mute` | `0` = unmuted, `1` = muted |
| `{name}/status/foregroundApp` | Active app ID (e.g. `netflix`, `com.webos.app.livetv`) |
| `{name}/status/currentChannel` | Current channel (JSON) when live TV is active |

### Commands (subscribe)

| Topic | Payload |
|---|---|
| `{name}/set/volume` | Number 0-100 |
| `{name}/set/mute` | `true` / `false` |
| `{name}/set/system/turnOff` | any |
| `{name}/set/launch` | App ID string |
| `{name}/set/button` | Button name (e.g. `HOME`, `BACK`, `VOLUMEUP`) |
| `{name}/set/toast` | Message string to display on TV |
