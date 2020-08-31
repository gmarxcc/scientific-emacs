# Readme 
This is the version `0.1` of scientific-emacs. This respositry contains the `Dockerfiles` to build the images for `Redis` and `Emacs`.

# Installation
To install the container first refer to the [Docker Installation Guide](https://docs.docker.com/docker-for-windows/install/). After test the **hello worlf of Docker system**, clone this repository within your
*working directory* using:

```
$ git clone http://gmarx.jumpingcrab.com:8088/mice-rs101/latex-basic.git
```

Then, it is possible to build the *scientifc-emacs* container by:

```
$ docker build -t scientific-emacs:0.1 docker/emacs/
```






To get the ip address
'''
open -a xquartz
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip
'''

To run the container

'''
docker run --rm -it  -v`pwd`/emacs-config:/root \
            -e DISPLAY=$ip:0 \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            gmarxcc/scientific-emacs:0.1
'''

the 'emacs-config' folder contains the '.emacs' configuration file  

To install:
- aspell
- curl
- wget
- git
- zsh

## After first run the container
Upgrade texlive to be able to install new packages by :

'''
apt-get upgrade texlive-base
'''

Then, init the user with 'tlmgr init-usertree'. After that you can install new packages using 'tlmgr install package'.

