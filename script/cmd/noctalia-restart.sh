#!/bin/bash

pkill -f 'qs -c noctalia-shell'
sleep 0.5
qs -c noctalia-shell &
