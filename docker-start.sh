#!/usr/bin/env bash

# shellcheck disable=SC2154
melon start "${service}"

trap "echo Shutting down ...; melon stop all -d; exit 0" SIGINT SIGTERM

# shellcheck disable=SC2154
if [[ ${log_to_file} == 'true' ]]; then
  # Ensures the log file actually exists, so we can tail successfully
  touch "$MELON_ROOT/log/debug.log"
  tail -F "$MELON_ROOT/log/debug.log" &
fi

while true; do sleep 1; done
