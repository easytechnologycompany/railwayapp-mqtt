# MQTT for railway.app

Deploy MQTT on railway.app with a single click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/C09s2G?referralCode=2_sIT9)

## ✨ Features

* MQTT with automated setup
* Password Authentication (Set username & password in environment variables)
* Timezone Support (Set timezone in environment variables)

## 🐍 How to Deploy

1. Click Deploy on Railway and setup your credentials in the environment variables

```bash
    TZ=Europe/Amsterdam
    MQTT_USER=yourusername
    MQTT_PASS=yourpassword
    PORT=1883 # Don't change this
```

2. Wait for Build & Deployment to Finish
3. Open the custom URL an enter your credentials

## 🐳  Local Development

```bash
docker compose up -d
```

Connect to http://localhost:1883 use setup username & password from docker-compose file to login to MQTT.
