FROM ubuntu
MAINTAINER Evan Bottcher <evan@bottch.com>

# install jdk7
RUN apt-get update
RUN apt-get install -y --no-install-recommends openjdk-7-jdk

# install leiningen
RUN apt-get install -y curl
RUN curl --location https://raw.github.com/technomancy/leiningen/stable/bin/lein -o /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein

# create a user for running dev commands
RUN adduser --disabled-password --gecos "Clojure development user" clojure

# run the self-install
RUN sudo -u clojure -i /usr/local/bin/lein

# create a volume for the directory contents from the host
VOLUME ["/opt/share"]

# default to run the repl
# USER clojure #=> doesn't simulate a real login?
CMD sudo -u clojure -i /bin/bash