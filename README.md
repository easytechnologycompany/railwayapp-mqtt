# MQTT for railway.app

Deploy MQTT on railway.app with a single click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/C09s2G?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

## ✨ Features

* MQTT with automated setup
* Optional password authentication via `MQTT_USER` and `MQTT_PASS`
* Timezone Support (Set timezone in environment variables)
* Railway config as code via `railway.toml`

## 🐍 How to Deploy

1. Click Deploy on Railway and setup your credentials in the environment variables

```bash
    TZ=Europe/Amsterdam
    MQTT_USER=yourusername
    MQTT_PASS=yourpassword
    PORT=1883 # Don't change this
```

## Production recommendations (Railway)

* Set both `MQTT_USER` and `MQTT_PASS` to enable authenticated access
* If one of them is missing, broker starts in anonymous mode
* Use persistent storage for `/mosquitto/data`
* Keep external TCP port mapped to `1883`

2. Wait for Build & Deployment to Finish
3. Open the custom URL an enter your credentials

## 🐳  Local Development

```bash
docker compose up -d
```

Connect to http://localhost:1883 use setup username & password from docker-compose file to login to MQTT.
