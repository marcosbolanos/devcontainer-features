#!/bin/sh
set -e

echo "Activating feature 'neovim'"

VERSION=${VERSION:-stable}

if ! command -v curl >/dev/null 2>&1; then
  echo "curl not found, attempting to install with apt..."
  apt-get update && apt-get install -y curl
fi

echo "Installing $VERSION version"

LATEST_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
NIGHTLY_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"

case $VERSION in
stable)
  URL=$LATEST_URL
  ;;
nightly)
  URL=$NIGHTLY_URL
  ;;
v*)
  URL="https://github.com/neovim/neovim/releases/download/$VERSION/nvim-linux-x86_64.tar.gz"
  ;;
*)
  echo "Unknown version: $VERSION" >&2
  exit 1
  ;;
esac

curl -LO $URL
rm -rf /opt/nvim-linux-x86_64
tar -C /opt -xzf nvim-linux-x86_64.tar.gz
chmod a+x /opt/nvim-linux-x86_64/bin/nvim
echo 'exec /opt/nvim-linux-x86_64/bin/nvim "$@"' >>/bin/nvim
chmod a+x /bin/nvim
