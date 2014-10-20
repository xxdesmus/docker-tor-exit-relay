docker-tor-exit-relay
================

Dockerfile to be use to build image for docker container with tor relay

How to use :

docker run -d -p 22 -p 9050:9050 -p 9001:9001 quantumobject/docker-tor-exit-relay

This container will generate dsa key for ssh the first time it is run ... need to add the private key to your  ~/.ssh/id_dsa to be able to ssh the container ...

To access it and configured and used the container :

docker exec -it container-id /bin/bash

them you can use it by usewithtor command

usewithtor ssh destination   ==>  to use ssh anonymous  (read about limitation and security at www.torproject.org)

you can create a new container everytime you need to use it and rm it when done with it ..(this bad idea if you want to keep an extable exit relay) 

I added the  Reduced Exit Policy to the configuration to make sure to drastically reduces the odds that a bittorrent user will select your node and it will reduce the risk of getting DMCA takedowns.


More info check please :

[https://www.torproject.org/docs/tor-relay-debian.html.en](https://www.torproject.org/docs/tor-relay-debian.html.en)

and 

[https://www.torproject.org/docs/faq.html.en](https://www.torproject.org/docs/faq.html.en)

note : because you use it don't mean your complete anonymous ... please read about tor at www.torproject.org before using it ....  this suppose to work like relay (will use 50k/100k of your network for exit relay..) 


you can use like reference to create your own configuration and Dockerfile , file torrc is the tor conf file ..
