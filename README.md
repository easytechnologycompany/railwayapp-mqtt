# MQTT for railway.app

![Template Header](./template-header.svg)


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

<!-- footer -->
<!-- footer -->
[![Airbyte](https://img.shields.io/badge/Airbyte-615EFF?style=for-the-badge&logo=airbyte&logoColor=white)](https://github.com/vergissberlin/railwayapp-airbyte)
[![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white)](https://github.com/vergissberlin/railwayapp-airflow)
[![CodiMD](https://img.shields.io/badge/CodiMD-0F766E?style=for-the-badge&logo=markdown&logoColor=white)](https://github.com/vergissberlin/railwayapp-codimd)
[![Email Service](https://img.shields.io/badge/Email%20Service-2563EB?style=for-the-badge&logo=maildotru&logoColor=white)](https://github.com/vergissberlin/railwayapp-email)
[![GitLab CE](https://img.shields.io/badge/GitLab%20CE-FC6D26?style=for-the-badge&logo=gitlab&logoColor=white)](https://github.com/vergissberlin/railwayapp-gitlab)
[![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://github.com/vergissberlin/railwayapp-grafana)
[![Home Assistant](https://img.shields.io/badge/Home%20Assistant-18BCF2?style=for-the-badge&logo=homeassistant&logoColor=white)](https://github.com/vergissberlin/railwayapp-homeassistant)
[![InfluxDB](https://img.shields.io/badge/InfluxDB-22ADF6?style=for-the-badge&logo=influxdb&logoColor=white)](https://github.com/vergissberlin/railwayapp-influxdb)
[![Mosquitto MQTT](https://img.shields.io/badge/Mosquitto%20MQTT-3C5280?style=for-the-badge&logo=eclipsemosquitto&logoColor=white)](https://github.com/vergissberlin/railwayapp-mqtt)
[![Node-RED](https://img.shields.io/badge/Node--RED-8F0000?style=for-the-badge&logo=nodered&logoColor=white)](https://github.com/vergissberlin/railwayapp-nodered)
[![OpenSearch](https://img.shields.io/badge/OpenSearch-005EB8?style=for-the-badge&logo=opensearch&logoColor=white)](https://github.com/vergissberlin/railwayapp-opensearch)
[![TYPO3 CMS](https://img.shields.io/badge/TYPO3%20CMS-FF8700?style=for-the-badge&logo=typo3&logoColor=white)](https://github.com/vergissberlin/railwayapp-typo3)
