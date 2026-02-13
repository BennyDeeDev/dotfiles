#!/bin/bash

# Setup i2c-dev kernel module for ddcutil

set -euo pipefail

echo "Loading i2c-dev kernel module..."
sudo modprobe i2c-dev

echo "Persisting i2c-dev module at boot..."
echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf

echo "Detecting displays..."
ddcutil detect
