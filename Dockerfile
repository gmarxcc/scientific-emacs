# Ubuntu bullseye
FROM debian:bullseye
ENV UNAME="scientific-emacs"
MAINTAINER gmarxcc
LABEL version="0.1"

# installing emacs
RUN apt-get update \
	&& apt-get -y install emacs

# installing texlive base with pdflatex utility:
RUN apt-get update \
    && apt-get -y install \
    texlive-latex-base

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
	imagemagick

# oh-my-zshell
RUN  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# updating texlive 
RUN apt-get update\
&& apt-get -y upgrade texlive-base

# packages installation
#RUN tlmgr init-usertree

#RUN tlmgr --usermode install collection-latexrecommended\
# 	collection-mathscience

# init
ENTRYPOINT ["zsh"]  
#ENTRYPOINT [“echo”, “Hello”]
#CMD [“World”]
