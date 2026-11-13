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
## Verified cross-network experiment

### Environment

Two containers were attached to separate Docker bridge networks.

| Container | Docker network | IP address |
|---|---|---|
| web1 | mynetwork | 172.18.0.2 |
| devops-app | bridge | 172.17.0.2 |

The `devops-app` container used image `muneeb-devops-app:v1`.

### Destination service verification

Container inspection reported exposed port metadata `5000/tcp`.

Inspection of `/proc/net/tcp` returned:

```text
00000000:1388 00000000:0000 0A
```

- `1388` is hexadecimal for port 5000.
- `00000000` represents a listener bound to all IPv4 interfaces.
- `0A` represents TCP LISTEN state.

The destination service was listening on port 5000, not 8080.

### Cross-network DNS test

The command `docker exec web1 ping -c 3 devops-app` failed with `ping: bad address 'devops-app'`.

The container name did not resolve through Docker's embedded DNS across these separate networks.

### Cross-network ICMP test

The command `docker exec web1 ping -c 3 -W 2 172.17.0.2` returned:

- 3 packets transmitted
- 0 packets received
- 100% packet loss

No ICMP replies were received.

### Cross-network TCP and HTTP test

An initial request to port 8080 timed out because it targeted the wrong port.

The corrected command was:

`docker exec web1 wget -S -O- -T 3 http://172.17.0.2:5000`

Observed response:

```text
HTTP/1.0 200 OK
Server: BaseHTTP/0.6 Python/3.12.16
Hello from Muneeb's Dockerized DevOps App!
```

This confirms successful direct TCP and HTTP communication between containers attached to different Docker bridge networks.

### Findings

| Test | Observed result |
|---|---|
| Cross-network DNS by container name | Failed |
| Cross-network ICMP | No replies |
| Cross-network TCP to port 5000 | Successful |
| HTTP response | 200 OK |

### Key learning

Separate bridge network membership and DNS scoping do not, by themselves, prove complete network isolation.

This experiment demonstrates that direct IP-based TCP communication was possible in the tested Docker Desktop environment.

ICMP failure must not be interpreted as proof that TCP is unavailable. Diagnose DNS, IP reachability, TCP ports, and application-layer responses independently.

These findings describe this tested environment, not a universal guarantee about every Docker Engine or Docker Desktop networking configuration.
