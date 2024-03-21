#!/bin/bash
# github.com/kika/flutter_hotreloader

while true
do
    find lib/ -name '*.dart' | entr -dnp "$HOME"/dotfiles/scripts/flutter/hotreload-helper.sh /_
done
