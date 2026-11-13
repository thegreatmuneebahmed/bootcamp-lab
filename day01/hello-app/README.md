# Hello App: Docker Fundamentals

## Objective

Containerize a simple Python HTTP server.

## Files

- `app.py`: Python HTTP server.
- `Dockerfile`: Container image instructions.

## Build

Run from this directory:

    docker build -t muneeb-hello-app:v1 .

## Run

    docker run -d --name hello-app -p 8000:8000 muneeb-hello-app:v1

## Verify

    curl http://localhost:8000

Expected response:

    hello from my first container

## Cleanup

    docker rm -f hello-app

## Concepts demonstrated

- Docker images and containers
- Dockerfile instructions
- Port publishing
- Running a container as a non-root user
