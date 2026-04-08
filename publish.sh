#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

VERSION=$(python3 -c "import yaml; print(yaml.safe_load(open('galaxy.yml'))['version'])")
NAMESPACE=$(python3 -c "import yaml; print(yaml.safe_load(open('galaxy.yml'))['namespace'])")
NAME=$(python3 -c "import yaml; print(yaml.safe_load(open('galaxy.yml'))['name'])")
TARBALL="${NAMESPACE}-${NAME}-${VERSION}.tar.gz"

echo "==> Building ${NAMESPACE}.${NAME} ${VERSION}"

rm -f "${NAMESPACE}"-"${NAME}"-*.tar.gz
ansible-galaxy collection build --force

echo ""
echo "==> Package: ${TARBALL}"
ls -lh "$TARBALL"

echo ""
echo "==> Contents:"
tar tzf "$TARBALL" | head -30
echo ""

if [ "${1:-}" = "--publish" ]; then
  if [ -z "${GALAXY_API_KEY:-}" ]; then
    echo "ERROR: Set GALAXY_API_KEY environment variable first."
    echo ""
    echo "  export GALAXY_API_KEY='your-galaxy-api-token'"
    echo "  ./publish.sh --publish"
    exit 1
  fi

  echo "==> Publishing ${NAMESPACE}.${NAME} ${VERSION} to Ansible Galaxy..."
  ansible-galaxy collection publish "$TARBALL" --api-key "$GALAXY_API_KEY"
  echo ""
  echo "SUCCESS: Published ${NAMESPACE}.${NAME} ${VERSION} to Ansible Galaxy!"
  echo "  https://galaxy.ansible.com/ui/repo/published/${NAMESPACE}/${NAME}/"
else
  echo "==> Dry run complete. To publish:"
  echo ""
  echo "  export GALAXY_API_KEY='your-galaxy-api-token'"
  echo "  ./publish.sh --publish"
fi
