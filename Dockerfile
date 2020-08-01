# Ubuntu bullseye
FROM debian:bullseye
ENV UNAME="scientific-emacs"
MAINTAINER gmarxcc
LABEL version="0.1"

# installing emacs
RUN apt-get update \
	&& apt-get -y install emacs
