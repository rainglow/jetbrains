#!/bin/bash

# Run docker image to build the themes.
docker run -e PATTERN=jetbrains -v $PWD/output/:/src/output daylerees/rainglow:latest

# Kill old themes.
rm -rf ../themes/*.xml

# Move themes to the root.
cp -R output/jetbrains/* ../themes

# Delete temp themes.
rm -rf output