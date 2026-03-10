#!/bin/bash
# Quick health check for cron
HEALTH=$(curl -sf http://localhost:9944/health)
if [ $? -ne 0 ]; then
  echo "[$(date)] Node unhealthy, restarting..." >> /var/log/qh-monitor.log
  docker-compose restart node
fi

# Check treasury balance
BAL=$(curl -sf https://paraxiom.org/api/v1/wallet/balance | jq '.total_usd')
echo "[$(date)] Treasury: \$${BAL}" >> /var/log/qh-monitor.log
