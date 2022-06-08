#!/bin/bash
while true; do
  echo -n "$1 $(date -u '+%y/%m/%d %H:%M:%S UTC') "
  if curl -H host:workload.tgw2.example.internal 100.64.17.7/txt -s -o /dev/null --connect-timeout 1; then
    echo "success"
  else
    echo "failed"
  fi
  sleep 1
done
