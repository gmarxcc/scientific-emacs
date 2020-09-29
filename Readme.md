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
Write here about container

# How to install
1. Clone this repository:
`git clone xxxx`
2. Build the container using: 
`docker build -t gmarxcc/scientific-emacs:0.1 docker/emacs/`
3. Run the container to test:
`docker run --rm -it gmarxcc/scientific-emacs:0.1`
4. Run an Ubuntu command like `ls`

Done, you are doing great!

# Executing emacs

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

# What is installed on the repository
The repository has previously installed
- aspell:
- curl: 
- auctex:
- pdftools:
- oh-my-zshell:
-

## How to run pyhton scripts

## After first run the container
Upgrade texlive to be able to install new packages by :

'''
apt-get upgrade texlive-base
'''

Then, init the user with 'tlmgr init-usertree'. After that you can install new packages using 'tlmgr install package'.

