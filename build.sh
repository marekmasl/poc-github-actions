#!/bin/bash

export PATH="/opt/arm-ca9-linux-gnueabihf-6.5/usr/bin:$PATH"

arm-ca9-linux-gnueabihf-g++ main.c -o hello
