#!/bin/bash -ex
V=$(cat extension/manifest.json | jq -Mr .version)
rm -f "tyt-amazon-$V.zip"
cd extension
zip -r "../tyt-amazon-$V.zip" . -x '*.DS_Store' -x '*Thumbs.db'
