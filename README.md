# docker-woggle

Fiddling with docker-based clojure dev environment

## Steps

1. Start the vagrant CoreOS VM and open a shell

        $ vagrant up
        $ vagrant ssh
        $ cd share
    
1. Create an image using the Dockerfile

        $ cd share
        $ docker build -t evanb/clojure .
    
1. Start an instance with bash

        $ docker run -ti -v /home/core/share:/home/clojure/share evanb/clojure
        $ cd share
        $ lein test
