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
texlive-latex-extra \
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
elpa-pdf-tools \
auctex \
zsh

# oh-my-zshell
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

# entrypoint
ENTRYPOINT ["zsh"]
