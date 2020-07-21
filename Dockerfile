FROM ubuntu:20.04
MAINTAINER holdlg <holdlg@live.com>

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

EXPOSE 3478

ENV USERNAME=username
ENV PASSWORD=password
ENV REALM=realm
ENV EXTERNALIP=11.11.11.11
ENV MIN_PORT=65435
ENV MAX_PORT=65535

RUN mkdir /var/lib/turn
RUN apt-get update && apt-get install -y coturn iproute2 && rm -rf /var/lib/apt/lists/*
  

ENTRYPOINT ["bash", "deploy-turnserver.sh"]    
