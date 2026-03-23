# Deploy and Host Mosquitto MQTT on Railway

![Eclipse Mosquitto logo](https://mosquitto.org/images/mosquitto-text-side-28.png)

**What is Mosquitto MQTT?** [Eclipse Mosquitto](https://mosquitto.org/) is a lightweight open-source message broker that implements the MQTT protocol. Publishers send messages to named topics; subscribers receive them in real time. It is widely used for IoT, telemetry, and event-driven backends where many clients need reliable, low-overhead messaging over TCP.

## About Hosting Mosquitto MQTT

Running Mosquitto in production means packaging the broker (often via Docker), exposing the correct TCP port (typically **1883** for plain MQTT), and persisting state if you rely on retained messages or durable sessions. You configure listeners, logging, and persistence paths, then decide whether connections are anonymous or authenticated (for example with `password_file`). On a platform like Railway, you connect the service’s public hostname and port to your clients, attach a volume for `/mosquitto/data` when you need persistence across deploys, and set environment variables for optional username/password auth so the broker starts with a consistent, secure policy.

## Common Use Cases

- **IoT and sensors** — Devices publish telemetry; dashboards or backends subscribe without polling.
- **Real-time apps** — Chat-style features, live updates, or coordination between services over topics.
- **Edge-to-cloud bridges** — A central broker aggregates messages from field gateways or smaller brokers.

## Dependencies for Mosquitto MQTT Hosting

- **Docker** — This template builds from the official `eclipse-mosquitto` image and adds project config (see `Dockerfile`).
- **Railway** — Account and project to build from the Dockerfile and run the service with the right **PORT** mapping to **1883**.

### Deployment Dependencies

- [Deploy on Railway (this template)](https://railway.app/template/C09s2G?referralCode=2_sIT9)
- [Eclipse Mosquitto](https://mosquitto.org/)
- [Mosquitto configuration (`mosquitto.conf`)](https://mosquitto.org/man/mosquitto-conf-5.html)
- [Railway documentation](https://docs.railway.app/)

### Implementation Details

The image extends `eclipse-mosquitto:latest`, copies `config/mqtt/mosquitto.conf`, and uses `docker-entrypoint.sh` to enable password auth when both `MQTT_USER` and `MQTT_PASS` are set.

```dockerfile
FROM eclipse-mosquitto:latest

COPY config/mqtt/mosquitto.conf /mosquitto/config/mosquitto.conf
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
```

`railway.toml` uses the Dockerfile builder and an `ON_FAILURE` restart policy:

```toml
[build]
builder = "DOCKERFILE"

[deploy]
restartPolicyType = "ON_FAILURE"
restartPolicyMaxRetries = 10
```

**Environment variables (Railway):**

| Variable     | Purpose |
| ------------ | ------- |
| `PORT`       | Railway injects this; map public TCP to **1883** for MQTT clients. |
| `MQTT_USER`  | If set together with `MQTT_PASS`, enables auth via `mosquitto_passwd`. |
| `MQTT_PASS`  | Password for `MQTT_USER`; if either is missing, anonymous access stays allowed (per entrypoint). |
| `TZ`         | Optional timezone for the container (e.g. `Europe/Berlin`). |

For production, set both `MQTT_USER` and `MQTT_PASS`, mount persistent storage on `/mosquitto/data`, and keep the external port aligned with **1883**.

## Why Deploy Mosquitto MQTT on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Mosquitto MQTT on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
