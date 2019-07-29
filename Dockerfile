# Webrtc Dev quick
#
# VERSION               2.0.0


FROM node:10-alpine

LABEL Description="qick startup image to start the webrtc dev executable" maintainer="Altanai" Version="=2.0"

#RUN apt-get update && apt-get install -y inotify-tools nginx apache2 openssh-server

# Create app directory
RUN mkdir -p /home/node
RUN mkdir -p /home/node/webrtcdev
RUN mkdir -p /home/node/webrtcdev/node_modules && chown -R node:node /home/node/webrtcdev

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /home/node/webrtcdev

# Install app dependencies
COPY package*.json ./
USER node
RUN npm install --loglevel=warn --only=prod

# Install global dependencies
WORKDIR /home/node/
RUN npm install -g http-server

COPY --chown=node:node . .

# Expose http port
EXPOSE 8080

CMD http-server --help
CMD [“echo”, “Container for WebrtcDev Quick startup”]
CMD ["http-server", "-S",  "-C" ,  "cert.pem" ,  "-o" ]