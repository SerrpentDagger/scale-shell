#!/bin/bash

if [[ -z "$FEATHERT" ]]; then
    echo "FEATHERT is not set!"
    exit 1
fi
mkdir "$FEATHERT"
