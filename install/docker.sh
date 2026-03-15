#!/bin/bash

set -euo pipefail

sudo systemctl enable --now docker
sudo usermod -aG docker ${USER}
