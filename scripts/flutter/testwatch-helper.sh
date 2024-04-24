#!/bin/bash

set -euo pipefail

filepath="$1"
relpath="${filepath:$2}"

echo $'\e[1;31m'$(date '+%H:%M:%S') $relpath$'\e[0m'
flutter test -j 2 ./test
