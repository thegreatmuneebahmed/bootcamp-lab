# DevOps Bootcamp Lab

A hands-on DevOps learning repository focused on Linux, Docker,
container networking, automation, CI/CD, infrastructure as code
and deployment.

The objective is to develop practical engineering skills through
reproducible labs, documented experiments and version-controlled work.

## Learning Roadmap

| Day | Topics | Status |
|---|---|---|
| 01 | Linux fundamentals and Docker basics | Completed |
| 02 | Docker Compose, storage and networking | Completed |
| 03 | Multi-container applications and Redis | Planned |
| 04 | Linux networking and troubleshooting | Planned |
| 05 | CI/CD with GitHub Actions | Planned |
| 06 | Terraform and Infrastructure as Code | Planned |
| 07 | Deployment, monitoring and final project | Planned |

See [the detailed roadmap](docs/roadmap.md).

## Repository Structure

    bootcamp-lab/
    ├── README.md
    ├── day01/
    │   ├── README.md
    │   ├── linux/
    │   └── hello-app/
    ├── day02/
    │   ├── README.md
    │   ├── compose-basics/
    │   ├── storage-lab/
    │   └── networking-lab/
    ├── docs/
    │   ├── baseline.md
    │   └── roadmap.md
    └── scripts/
        └── baseline.sh

## Environment

| Component | Configuration |
|---|---|
| Operating system | Ubuntu 24.04 LTS |
| Environment | Windows WSL2 |
| Container platform | Docker Desktop |
| Container tooling | Docker Compose |
| Programming language | Python 3.12 |
| Version control | Git and GitHub |

See [system baseline](docs/baseline.md).

## Getting Started

Clone the repository:

    git clone git@github.com:thegreatmuneebahmed/bootcamp-lab.git

    cd bootcamp-lab

Navigate to an individual lab directory and follow its README.

Most Docker labs use:

    docker compose up -d --build

To stop a Compose lab:

    docker compose down

Always inspect the lab README before running cleanup commands.

## Skills Demonstrated

- Linux administration
- Users, groups and permissions
- Process and service management
- System log inspection
- Docker image creation
- Container lifecycle management
- Docker Compose
- Persistent storage
- Bridge networking
- Container DNS and network isolation
- Git version control

## Documentation Standards

Each lab should document:

1. Objective
2. Architecture or workflow
3. Prerequisites
4. Implementation steps
5. Verification commands
6. Expected results
7. Cleanup procedure
8. Key learnings and limitations

## Progress Policy

A day is marked completed only after practical verification,
documentation and a successful Git commit.

This repository records actual work performed.
Planned or unverified capabilities must not be represented as completed.
