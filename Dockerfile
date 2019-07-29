FROM node:10-alpine

# Create app directory
RUN mkdir -p /home/node
RUN mkdir -p /home/node/webrtcdev
RUN mkdir -p /home/node/webrtcdev/node_modules && chown -R node:node /home/node/webrtcdev
WORKDIR /home/node/webrtcdev

# Install app dependencies
COPY package*.json ./
USER node
RUN npm install

# Install global dependencies
RUN npm install -g http-server

COPY --chown=node:node . .

# Expose http port
EXPOSE 8080

CMD [ "http-server", "-S",  "-C" ,  "cert.pem" ,  "-o" ]