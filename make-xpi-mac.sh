#!/bin/bash -ex
cp -r extension/{img,background.js} firefox

V=$(cat firefox/manifest.json | grep '"version"' | grep -o "\d*\.\d*\.\d*")
rm -f "tyt-amazon-$V.xpi"
cd firefox
zip -r "../tyt-amazon-$V.xpi" . -x '*.coffee' -x '*.git*' -x '*.DS_Store' -x '*Thumbs.db'
