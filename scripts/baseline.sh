#!/usr/bin/env bash
set -euo pipefail

ver() {
    command -v "$1" >/dev/null 2>&1 && "$@" 2>&1 | head -1 || echo "NOT INSTALLED"
}

echo "# System Baseline"
echo ""
echo "- Date: $(date -I)"
echo "- Host: $(hostname)"
echo "- Kernel: $(uname -r)"
echo "- CPUs: $(nproc)"
echo ""

echo "## Operating System"
grep '^PRETTY_NAME=' /etc/os-release

echo ""
echo "## Memory"
free -h

echo ""
echo "## Disk"
df -h /

echo ""
echo "## Tool Versions"
echo "- Git: $(ver git --version)"
echo "- Docker: $(ver docker --version)"
echo "- Python: $(ver python3 --version)"

