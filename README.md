# qh-node-config

Internal config for QuantumHarmony validator deployment.

## Setup

```bash
cp .env.example .env
# Edit .env with your credentials
docker-compose up -d
```

## Services

- Node RPC: `ws://localhost:9944`
- Dashboard: `http://localhost:8080`
- Faucet: `http://localhost:8085`

## Monitoring

Check node health:
```bash
curl http://localhost:9944/health
```
