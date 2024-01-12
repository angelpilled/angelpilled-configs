#!/bin/sh

for file in *.mp4; do
    if [ -f "$file" ]; then
	baseName=$(basename "$file" .mp4)
	ffmpeg -i "$file" "${baseName}.mp3"
    fi
done
