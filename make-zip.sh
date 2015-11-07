#!/bin/bash -ex
V=$(cat extension/manifest.json | grep '"version"' | grep -o "\d*\.\d*\.\d*")
rm -f "tyt-amazon-v$V.zip"
zip -r "tyt-amazon-v$V.zip" extension/*
