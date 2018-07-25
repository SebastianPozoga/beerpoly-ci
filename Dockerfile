FROM goatcms/webslots
RUN apt-get update

# build tools (for npm addons etc)
RUN apt-get install -y build-essential

# nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

# nodejs packages and upgread
RUN \
  npm install -g n && \
  npm install -g gulp && \
  npm install -g jshint && \
  npm install -g bower && \
  npm install -g yarn

# ruby
RUN apt-get install -y ruby-full

# sass install
RUN gem install sass

# RAN static file server
RUN go get -u github.com/m3ng9i/ran

# Add config
COPY config/slots /go/src/github.com/goatcms/webslots/config/slots
COPY config/tasks /go/src/github.com/goatcms/webslots/config/tasks

# entrypoint
COPY beerpoly-entrypoint.sh "/go/src/github.com/goatcms/webslots/docker/beerpoly-entrypoint.sh"
RUN chmod +x "/go/src/github.com/goatcms/webslots/docker/beerpoly-entrypoint.sh"
ENTRYPOINT ["/go/src/github.com/goatcms/webslots/docker/beerpoly-entrypoint.sh"]
CMD []
