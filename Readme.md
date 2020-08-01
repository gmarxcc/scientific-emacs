# Readme 

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

