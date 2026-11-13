# Day 02: Docker Compose, Storage and Networking

## Learning objectives

- Define applications using Docker Compose.
- Understand container networking.
- Use named volumes for persistent data.
- Understand container DNS and service discovery.
- Publish container ports safely.
- Test network isolation.

## Labs

| Lab | Description |
|---|---|
| [Compose Basics](compose-basics/README.md) | Run an application using Docker Compose |
| [Storage Lab](storage-lab/README.md) | Persist application data using a named volume |
| [Networking Lab](networking-lab/README.md) | Bridge networks, DNS, port publishing and isolation |

## Completion

The storage and networking exercises have been completed and documented.
Compose basics was introduced through the earlier Compose exercise.

## Important

Do not confuse container port exposure with host port publishing.
A container can expose a port without making it accessible through the host.
