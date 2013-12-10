docker-tor-relay
================

Dockerfile to be use to build image for docker container with tor relay

How to use :

docker run -d -p 22 angelrr7702/tor-relay

check docker port and ssh it  (login:password ==>  root:rootprovisional) 

passwd  ==> to change password 

them you can use it by usewithtor command

usewithtor ssh destination   ==>  to use ssh anonymous  (read about limitation and security at www.torproject.org)


you can create a new container everytime you need to use it and rm it when done with it ..

More info check please :

https://www.torproject.org/docs/tor-relay-debian.html.en

and 

https://www.torproject.org/docs/faq.html.en

note : because you use it don't mean your complete anonymous ... please read about tor at www.torproject.org before using it ....  this suppose to work like relay (will use 50k/100k of your network for exit relay..) still no sure if exit relay working the way suppose to be ... if somebody can test it that have more time working with tor .. will apresiated it ..
maybe you need to add more port -p 9050:9050 -p 9001:9001 -p  for it to work like relay under docker ...

you can use like reference to create your own configuration and Dockerfile , file torrc is the tor conf file ..


