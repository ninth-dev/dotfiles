#!/bin/bash

bloop_pids=$(ps aux | grep bloop | grep -v 'grep' | grep -v 'kill-bloop'| awk '{print $2}')

for bloop_pid in $bloop_pids; do
  echo "Killing Bloop (PID:$bloop_pid)"
  kill -9 "$bloop_pid"
done




