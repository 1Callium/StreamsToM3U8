#!/bin/bash
python3 -m pip install requests
python3 -m pip install lxml
python3 -m pip install pytz
python3 -m pip install beautifulsoup4
python3 -m pip install -U "yt-dlp[default]" yt-dlp-ejs

# yt-dlp needs a JavaScript runtime (Deno) to read YouTube streams
if ! command -v deno >/dev/null 2>&1; then
  curl -fsSL https://deno.land/install.sh | sh -s -- -y > /dev/null
  export PATH="$HOME/.deno/bin:$PATH"
fi
deno --version | head -1

python3 grabber.py > ./streams.m3u8

echo M3U update complete.
