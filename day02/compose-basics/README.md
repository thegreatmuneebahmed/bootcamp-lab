# Docker Compose Basics

## Objective

Run a Python HTTP application through Docker Compose.

## Files

- `app.py`: HTTP server.
- `Dockerfile`: Builds the application image.
- `docker-compose.yml`: Defines the web service.

## Start

    docker compose up -d --build

## Verify

    docker compose ps
    curl http://localhost:8001

Expected response:

    Hello from Docker Compose!

## Logs

    docker compose logs -f web

## Stop and remove containers

    docker compose down

## Concepts demonstrated

- Compose service definition
- Image building
- Host-to-container port mapping
- Container lifecycle management
