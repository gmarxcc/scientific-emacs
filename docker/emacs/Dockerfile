# Ubuntu
FROM ubuntu:focal
ENV UNAME="scientific-emacs"
MAINTAINER gmarxcc
LABEL version="0.1"
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# installing emacs
RUN apt-get update \
&& apt-get install -y emacs	

# installing texlive base with pdflatex utility:
RUN apt-get -y install \
texlive-latex-base \
texlive-latex-recommended \
texlive-pictures \
texlive-science \
texlive-bibtex-extra

# useful apps
RUN apt-get -y install \
git \	
wget \
curl \
aspell \
vim \
python3 \
zsh

# oh-my-zshell
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh)" -- \
    -p git -p ssh-agent

# entrypoint
ENTRYPOINT ["zsh"]
