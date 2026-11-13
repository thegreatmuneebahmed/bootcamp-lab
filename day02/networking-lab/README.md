# Day 02: Docker Networking Lab

## Objective
Practice Docker bridge networks, container DNS, port publishing, and network isolation.

## Environment
- Ubuntu 24.04 on WSL2
- Docker Desktop with WSL2 integration
- Docker Compose v5.5.1
- Nginx Alpine

## 1. User-defined Bridge Network

Created `mynetwork` and connected `web1` and `web2`.

Command:
    docker network create mynetwork

Test:
    docker exec web1 ping -c 4 web2

Result: 4 packets transmitted, 4 received, 0% packet loss.

Network details:
- Driver: bridge
- Subnet: 172.18.0.0/16
- Gateway: 172.18.0.1
- web1: 172.18.0.2
- web2: 172.18.0.3

## 2. Port Publishing

Started Nginx:

    docker run -d --name web-public --network mynetwork -p 8085:80 nginx:alpine

Test:
    curl -I http://localhost:8085

Result: HTTP/1.1 200 OK.

Port mapping:
- Host: 8085
- Container: 80
- Container IP: 172.18.0.4

Security note: Ports bind to all host interfaces by default.
Use `127.0.0.1:8085:80` for local-only access.

## 3. Network Isolation

Created `isolated-net` and started `isolated-web` on it.

Test:
    docker exec web1 ping -c 3 isolated-web

Result: DNS resolution failed because the containers did not share a network.

## 4. Multiple Network Membership

Connected the container to `mynetwork`:

    docker network connect mynetwork isolated-web

Result: DNS resolution and ping succeeded.

Disconnected it:

    docker network disconnect mynetwork isolated-web

Result: DNS resolution failed again.

## Key Learnings

1. User-defined bridge networks provide container-name DNS.
2. Containers on a shared network can communicate.
3. Separate networks provide default isolation.
4. Containers can belong to multiple networks.
5. Port publishing exposes container services through host ports.
6. Prefer service names over hardcoded IP addresses.
7. Network isolation is not a complete security boundary.

## Cleanup

Removed the lab containers and isolated network:

    docker rm -f isolated-web web-public
    docker network rm isolated-net

Retained `mynetwork`, `web1`, and `web2`.

## Completion Evidence

- [x] Bridge network tested
- [x] Container DNS verified
- [x] Container connectivity verified
- [x] Port publishing verified
- [x] HTTP 200 response verified
- [x] Network isolation tested
- [x] Multiple network membership tested
- [x] Isolation restored
- [x] Lab resources cleaned up
