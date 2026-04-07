#!/bin/bash

if [[ -z "${FEATHERSTAMP:-}" ]]; then
	FEATHERSTAMP=$(date +%s)
	export FEATHERSTAMP
fi
