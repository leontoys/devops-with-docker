# youtube downloader

docker run -it ubuntu:24.04

apt-get update && apt-get install -y curl

curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp

apt-get install -y python3 ffmpeg

yt-dlp

