#!/bin/bash

# Run docker image to build the themes.
docker run -e PATTERN=jetbrains -v $PWD/output/:/src/output daylerees/rainglow:latest

# Kill old themes and plugin.
rm -rf ../rainglow.jar
rm -rf ../colors/*.xml

# Move themes to the root.
cp -R output/jetbrains/* ../colors

# Delete temp themes.
rm -rf output

# Package plugin JAR.
jar cf ../rainglow.jar ../META-INF ../colors