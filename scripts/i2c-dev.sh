#!/bin/bash

sudo modprobe i2c-dev

echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf

ddcutil detect
