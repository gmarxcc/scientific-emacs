# Ubuntu bullseye
FROM ubuntu:bionic
ENV UNAME="scientific-emacs"
MAINTAINER gmarxcc
LABEL version="0.1"
ENV DEBIAN_FRONTEND=noninteractive

# installing emacs
RUN apt-get update \
	&& apt-get -y install emacs

# installing texlive base with pdflatex utility:
RUN  apt-get update \
&& apt-get install -f -y \
dvipng \
ghostscript \
make \
latex-cjk-all \
latex-cjk-common \
latexmk \
lcdf-typetools \
lmodern \
poppler-utils \
psutils \
purifyeps \
t1utils \
tex-gyre \
tex4ht \
texlive-base \
texlive-bibtex-extra \
texlive-binaries \
texlive-extra-utils \
texlive-font-utils \
texlive-fonts-extra \
texlive-fonts-extra-links \
texlive-fonts-recommended \
texlive-formats-extra \
texlive-lang-all \
texlive-latex-base \
texlive-latex-extra \
texlive-latex-recommended \
texlive-luatex \
texlive-metapost \
texlive-pictures \
texlive-plain-generic \
texlive-pstricks \
texlive-publishers \
texlive-science \
texlive-xetex \
texlive-bibtex-extra

#installing some usefull apps
RUN apt-get update\
    && apt-get -y install \
	git \
	zsh \
	wget \
	curl \
	apt-utils\
	aspell\
	vim\
	imagemagick\
	perl-tk \
	python3

#installing usefull command-line tools
RUN apt-get update\
&& apt-get -y install \
csvkit

# init
ENTRYPOINT ["zsh"]  
#ENTRYPOINT [“echo”, “Hello”]
#CMD [“World”]
