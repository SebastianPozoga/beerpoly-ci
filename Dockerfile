FROM goatcms/webslots
RUN apt-get update

# ruby
RUN apt-get install -y ruby-full

# nodejs install
RUN \
  git clone https://github.com/nodejs/node.git node && \
  cd node && \
  git checkout v8.3.0 && \
  ./configure && make && make install \
  cd .. \
  rm -rf node

# nodejs packages and upgread
RUN \
  npm install -g n && \
  npm install -g gulp && \
  npm install -g jshint && \
  npm install -g bower && \
  npm install -g yarn

# sass install
RUN gem install sass

# Add config
COPY slots /go/src/github.com/goatcms/webslots/config/
COPY tasks /go/src/github.com/goatcms/webslots/config/

# entrypoint
ENTRYPOINT ["/go/src/github.com/goatcms/webslots/docker/entrypoint.sh"]
CMD []
