FROM ubuntu:latest
MAINTAINER hjoll6


ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND="noninteractive"
USER root

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
RUN sed -Ei 's/^#\s+deb-src/deb-src/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential git python3
RUN apt-get build-dep -y emacs

WORKDIR /home/root

# RUN echo "hello world"

# ENTRYPOINT ["

# VOLUME ["/"]
