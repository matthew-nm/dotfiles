#!/bin/bash

WD="$(pwd)"
CUTLENGTH=$((${#WD} + 1))

echo "Watching for file changes..."

while true; do
  find . -not -path '*/.*' -name '*.dart' | entr -dnp "$HOME"/dotfiles/scripts/flutter/testwatch-helper.sh /_ $CUTLENGTH
done
