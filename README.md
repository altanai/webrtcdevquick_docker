# quicly start a webrtc video Call session 

### Webrtc DEV Lib
install npm module
```
npm install webrtcdevelopment
```

### Secure HTTP server 

# Create CA
openssl req -batch -new -newkey ec:<(openssl ecparam -name prime256v1) -nodes -keyout ca-key.pem -x509 -out ca.pem -days 3650 -subj "/CN=A localhost CA"

# Create a CSR for localhost, then sign it by CA
openssl req -batch -new -newkey ec:<(openssl ecparam -name prime256v1) -nodes  -keyout key.pem -subj /CN=localhost | openssl x509 -req -CAkey ca-key.pem -CA ca.pem -CAcreateserial -out cert.pem -days 365 -extfile <(echo subjectAltName=DNS:localhost)

$ http-server -S -C cert.pem -o
Starting up http-server, serving ./ through https
Available on:
  https:127.0.0.1:8080
  https:192.168.1.101:8080
  https:192.168.1.104:8080
Hit CTRL-C to stop the server

## docker 

Build application image
```
docker build -t altanai/webrtcdevquick .
```
see list of images
```
>docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
altanai/webrtcdevquick   latest              579cf230a307        10 seconds ago      113MB
node                     10-alpine           9dfa73010b19        6 weeks ago         75.3MB
```

Build the container 
```
docker run --name webrtcdevquick_container -p 8084:8080 -d altanai/webrtcdevquick
```
output of this will give congianer ID 

see list of containers  
```
> docker ps
```

## Debugging 

Issue 1 : failed to dial gRPC: unable to upgrade to h2c, received 502 
solution :  restart docker with experimental features off, look out for system soace in docker info

