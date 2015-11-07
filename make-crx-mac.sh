#!/bin/bash -ex
WD=$(pwd)
V=$(cat extension/manifest.json | grep '"version"' | grep -o "\d*\.\d*\.\d*")

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --pack-extension="$WD/extension" --pack-extension-key="$WD/tyt-amazon.pem"

mv extension.crx "tyt-amazon-v$V.crx"
