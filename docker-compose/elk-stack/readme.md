# Elasticsearch + Kibana Setup Guide (Docker Compose)

## 1. Start Elasticsearch

Make sure your `compose.yml` is in the current directory, then start only Elasticsearch:

```bash
docker-compose up -d elasticsearch
```

Wait a few seconds for Elasticsearch to fully initialize before continuing.

---

## 2. Create a service token for Kibana

This token allows Kibana to authenticate with Elasticsearch.

```bash
docker exec elasticsearch elasticsearch-service-tokens create elastic/kibana kibana-service-token
```

Copy the output token for the next step.

---

## 3. Export the service token as an environment variable

Replace `<token>` with the output from the previous command:

```bash
export SERVICE_TOKEN=<token>
```

If you're using a `.env` file with Docker Compose, you can also add:

```
SERVICE_TOKEN=<token>
```

---

## 4. Start Kibana

Now start Kibana, which will read the token from your environment:

```bash
docker-compose up -d kibana
```
