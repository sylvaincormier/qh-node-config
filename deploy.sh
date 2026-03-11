#!/bin/bash
# Quick deploy script for validator nodes
# Run on fresh Ubuntu 22.04

set -e

echo "Installing Docker..."
curl -fsSL https://get.docker.com | sh

echo "Pulling images..."
docker-compose pull

echo "Starting services..."
docker-compose up -d

echo "Waiting for node to sync..."
sleep 30

# Check health
curl -sf http://localhost:9944/health && echo "Node healthy" || echo "Node not ready yet"

echo ""
echo "Dashboard: http://$(hostname -I | awk '{print $1}'):8080"
echo "RPC:       ws://$(hostname -I | awk '{print $1}'):9944"
echo ""
echo "To check treasury balance:"
echo "  curl https://paraxiom.org/api/v1/wallet/balance"
