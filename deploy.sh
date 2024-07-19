#! /bin/sh

# Pulling images
docker pull revanth7733/user_service:latest
docker pull revanth7733/product_service:latest
docker pull revanth7733/order_service:latest

# Starting compose
docker compose up
