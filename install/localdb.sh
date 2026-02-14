#!/bin/bash

set -euo pipefail

# Update locate database so that locate will find everything installed
sudo updatedb
