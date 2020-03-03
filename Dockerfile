FROM fedora
# This will be base image.
MAINTAINER vibhuti
# Developer infor
ARG web=http
# This variable will not be available in container. 
ENV server=$web
ENV color=black
# All env variables will be present in container. 
RUN yum install $server -y
# install httpd server
WORKDIR /opt/
#it will be changing current dir in the container
COPY . .
# copy all files in current dir to docker image
EXPOSE 80
#exposing port 80 in the container
ENTRYPOINT ["/bin/bash","/opt/entrypt.sh"] 
