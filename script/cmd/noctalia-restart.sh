#!/bin/bash

pkill -f 'qs -c noctalia-shell'
sleep 0.5
nohup qs -c noctalia-shell >/dev/null 2>&1 &
