#!/data/data/com.termux/files/usr/bin/bash

read -p "Paste YouTube URL: " yurl

# Get direct video stream URL
videourl=$(yt-dlp -f "best[height<=720]" -g "$yurl")
title=$(yt-dlp --get-title "$yurl")

# Print title
echo -e "\n▶ Now playing: $title\n"

# Open in VLC or default player
termux-open-url "$videourl"
