# Docker Storage Lab

## Objective

Demonstrate persistent application data using Docker named volumes.

## Architecture

The Python HTTP application stores its visit counter in:

    /data/visits.txt

The directory `/data` is backed by the named volume `appdata`.

## Start

    docker compose up -d --build

## Test persistence

    curl http://localhost:8002
    curl http://localhost:8002
    curl http://localhost:8002

The visit counter should increase with each request.

## Inspect

    docker compose ps
    docker volume ls
    docker volume inspect storage-lab_appdata

The actual volume name may vary according to the Compose project name.

## Remove containers

    docker compose down

The named volume is retained by default.

## Remove containers AND volume

    docker compose down -v

WARNING: This deletes the persistent lab data.

## Concepts demonstrated

- Container writable layers
- Named volumes
- Data persistence
- Volume lifecycle
