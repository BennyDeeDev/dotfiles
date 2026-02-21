#!/bin/bash

set -euo pipefail

sudo sed -i 's/^timeout .*/timeout 0/' /boot/loader/loader.conf
