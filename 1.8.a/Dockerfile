FROM ubuntu:24.04

WORKDIR /mydir

RUN apt-get update && apt-get install -y curl python3 ffmpeg

RUN curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp

RUN chmod a+rx /usr/local/bin/yt-dlp

#if we use cmd we can't append url to it, instead it replaces whatever is in CMD so use ENTRYPOINT
#CMD ["/usr/local/bin/yt-dlp"]
#by default, the entrypoint in Docker is set as /bin/sh -c

ENTRYPOINT ["/usr/local/bin/yt-dlp"]

#default argument
CMD ["https://www.youtube.com/watch?v=Aa55RKWZxxI"]
