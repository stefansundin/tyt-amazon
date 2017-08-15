#!/bin/bash -ex
cp -r extension/{img,background.js} firefox

V=$(cat firefox/manifest.json | jq -Mr .version)
rm -f "tyt-amazon-$V.xpi"
cd firefox
zip -r "../tyt-amazon-$V.xpi" . -x '*.DS_Store' -x '*Thumbs.db'
