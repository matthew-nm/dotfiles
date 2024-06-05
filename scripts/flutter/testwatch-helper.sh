#!/bin/bash

set -euo pipefail

filepath="$1"
relpath="${filepath:$2}"

echo -n $'\e[1;31m'$(date '+%H:%M:%S') $relpath$'\e[0m'

if [[ "$filepath" == *_test.dart ]]; then
  echo " (running test file)"
  fvm flutter test "$filepath"
else
  echo " (running test suite)"
  fvm flutter test -j 2 ./test
fi
