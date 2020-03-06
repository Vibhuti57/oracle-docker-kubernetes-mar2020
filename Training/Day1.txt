[vibhuti@ip-172-31-39-204 ~]$ sudo yum install docker
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Package docker-18.09.9ce-2.amzn2.x86_64 already installed and latest version
Nothing to do

-------------------------------------------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ sudo systemctl start docker
[vibhuti@ip-172-31-39-204 ~]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2020-03-02 06:28:34 UTC; 28s ago
     Docs: https://docs.docker.com
  Process: 14372 ExecStartPre=/usr/libexec/docker/docker-setup-runtimes.sh (code=exited, status=0/SUCCESS)
  Process: 14364 ExecStartPre=/bin/mkdir -p /run/docker (code=exited, status=0/SUCCESS)
 Main PID: 14384 (dockerd)
    Tasks: 12
   Memory: 30.9M
   CGroup: /system.slice/docker.service
           └─14384 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --defaul...

Mar 02 06:28:33 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:33.800772689...c
Mar 02 06:28:33 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:33.800926918...c
Mar 02 06:28:33 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:33.827176061..."
Mar 02 06:28:33 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:33.827896199..."
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:34.349478341..."
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:34.545214372..."
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:34.589280420...e
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:34.589746530..."
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal dockerd[14384]: time="2020-03-02T06:28:34.604930204...
Mar 02 06:28:34 ip-172-31-39-204.ec2.internal systemd[1]: Started Docker Application Container E...e.
Hint: Some lines were ellipsized, use -l to show in full.

[vibhuti@ip-172-31-39-204 ~]$ sudo docker info
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 18.09.9-ce
Storage Driver: overlay2
 Backing Filesystem: xfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 894b81a4b802e4eb2a91d1ce216b8817763c29fb
runc version: 2b18fe1d885ee5083ef9f0838fee39b62d653e30
init version: fec3683
Security Options:
 seccomp
  Profile: default
Kernel Version: 4.14.165-131.185.amzn2.x86_64
Operating System: Amazon Linux 2
OSType: linux
Architecture: x86_64
CPUs: 2
Total Memory: 3.851GiB
Name: ip-172-31-39-204.ec2.internal
ID: V4SF:2L3H:EYFC:ZZ2H:YTDO:NR7Q:GQLM:2GJU:F3VS:KCRT:KDNZ:FD43
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false

[vibhuti@ip-172-31-39-204 ~]$ sudo docker search oracle
NAME                                  DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
oraclelinux                           Official Docker builds of Oracle Linux.         633                 [OK]                
jaspeen/oracle-11g                    Docker image for Oracle 11g database            148                                     [OK]
oracleinanutshell/oracle-xe-11g                                                       84                                      
oracle/openjdk                        Docker images containing OpenJDK Oracle Linux   60                                      [OK]
oracle/graalvm-ce                     GraalVM Community Edition Official Image        57                                      [OK]
absolutapps/oracle-12c-ee             Oracle 12c EE image with web management cons…   38                                      
araczkowski/oracle-apex-ords          Oracle Express Edition 11g Release 2 on Ubun…   27                                      [OK]
bofm/oracle12c                        Docker image for Oracle Database                23                                      [OK]
oracle/nosql                          Oracle NoSQL on a Docker Image with Oracle L…   23                                      [OK]
datagrip/oracle                       Oracle 11.2 & 12.1.0.2-se2 & 11.2.0.2-xe        16                                      [OK]
truevoly/oracle-12c                   Copy of sath89/oracle-12c image (https://git…   12                                      
oracle/weblogic-kubernetes-operator   Docker images containing the Oracle WebLogic…   10                                      
openweb/oracle-tomcat                 A fork off of Official tomcat image with Ora…   8                                       [OK]
18fgsa/oracle-client                  Hosted version of the Oracle Container Image…   2                                       
softwareplant/oracle                  oracle db                                       2                                       [OK]
iamseth/oracledb_exporter             A Prometheus exporter for Oracle modeled aft…   2                                       
paulosalgado/oracle-java8-ubuntu-16   Oracle Java 8 on Ubuntu 16.04 LTS.              2                                       [OK]
publicisworldwide/oracle-core         This is the core image based on Oracle Linux…   1                                       [OK]
roboxes/oracle7                       A generic Oracle Linux 7 base image.            1                                       
amd64/oraclelinux                     Official Docker builds of Oracle Linux.         0                                       
pivotaldata/oracle7-test              Oracle Enterprise Linux (OEL) image for GPDB…   0                                       
bitnami/oraclelinux-extras            Oracle Linux base images                        0                                       [OK]
arm64v8/oraclelinux                   Official Docker builds of Oracle Linux.         0                                       
bitnami/oraclelinux-runtimes          Oracle Linux runtime-optimized images           0                                       [OK]
toolsmiths/oracle7-test       

-------------------------------------------------------------------------------------------------------------------------------------------                                                        0                                       

[vibhuti@ip-172-31-39-204 ~]$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
java                latest              d23bdf5b1b1b        3 years ago         643MB
[vibhuti@ip-172-31-39-204 ~]$ sudo docker pull java
Using default tag: latest
latest: Pulling from library/java
Digest: sha256:c1ff613e8ba25833d2e1940da0940c3824f03f802c449f3d1815a66b7f8c0e9d
Status: Image is up to date for java:latest
[vibhuti@ip-172-31-39-204 ~]$ sudo docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
Digest: sha256:ab00606a42621fb68f2ed6ad3c88be54397f981a7b70a79db3d1172b11c4367d
Status: Image is up to date for alpine:latest
[vibhuti@ip-172-31-39-204 ~]$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
python              latest              f88b2f81f83a        4 days ago          933MB
mysql               latest              c8ad2be69a22        4 days ago          465MB
alpine              latest              e7d92cdc71fe        6 weeks ago         5.59MB
java                latest              d23bdf5b1b1b        3 years ago         643MB

[vibhuti@ip-172-31-39-204 ~]$ uname
Linux
[vibhuti@ip-172-31-39-204 ~]$ uname -i
x86_64
[vibhuti@ip-172-31-39-204 ~]$ sudo docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
python                latest              f88b2f81f83a        4 days ago          933MB
mysql                 latest              c8ad2be69a22        4 days ago          465MB
node                  latest              e0e011be5f0f        5 days ago          942MB
oracle/nosql          latest              e6e5996d8436        10 days ago         539MB
oraclelinux           latest              3e27ddc05b59        4 weeks ago         232MB
alpine                latest              e7d92cdc71fe        6 weeks ago         5.59MB
truevoly/oracle-12c   latest              21789d4d876f        13 months ago       5.7GB
hello-world           latest              fce289e99eb9        14 months ago       1.84kB
java                  latest              d23bdf5b1b1b        3 years ago         643MB
[vibhuti@ip-172-31-39-204 ~]$ sudo docker run alpine cal
     March 2020
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
                     
-------------------------------------------------------------------------------------------------------------------------------------------                                                        0                                       

[vibhuti@ip-172-31-39-204 ~]$ sudo docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
db4f4948d0d7        oraclelinux         "cal"               22 seconds ago      Exited (0) 21 seconds ago                       determined_euler
190104d2fbc6        alpine              "cal"               31 seconds ago      Exited (0) 30 seconds ago                       angry_bassi
9bf15d5c102e        alpine              "cal"               2 minutes ago       Exited (0) 2 minutes ago                        mystifying_roentgen
03f68a80524d        alpine              "cal"               2 minutes ago       Exited (0) 2 minutes ago                        heuristic_tu
[vibhuti@ip-172-31-39-204 ~]$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

[vibhuti@ip-172-31-39-204 ~]$ sudo docker run --name vibhutic1 alpine vi

[vibhuti@ip-172-31-39-204 ~]$ sudo docker rm vibhutic1
vibhutic1
[vibhuti@ip-172-31-39-204 ~]$ sudo docker run --name vibhutic1 -d alpine ping google.com
f1b3748a7d61059eb8405f53b2a6ac2bd842f3abc73f236e7cf391deadf0c2b8
[vibhuti@ip-172-31-39-204 ~]$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
32b3befdf46d        alpine              "ping google.com"   1 second ago         Up 1 second                             pravin1
28bb39cc79dd        alpine              "ping google.com"   16 seconds ago       Up 15 seconds                           gul1
f1b3748a7d61        alpine              "ping google.com"   29 seconds ago       Up 28 seconds                           vibhutic1
5e1d95821676        alpine              "ping google.com"   About a minute ago   Up About a minute                       ashuc2

sudo docker logs vibhutic1
sudo docker ps
sudo docker logs vibhutic1 -f
-------------------------------------------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ sudo docker run --name vibhutic1 -d alpine ping google.com
72650fb8e300945c9eddb0442d6677974229bce4eb03767f6bbe5658d3a0722b
[vibhuti@ip-172-31-39-204 ~]$ sudo docker stop vibhutic1
vibhutic1
[vibhuti@ip-172-31-39-204 ~]$ sudo docker kill vibhutic1
Error response from daemon: Cannot kill container: vibhutic1: Container 72650fb8e300945c9eddb0442d6677974229bce4eb03767f6bbe5658d3a0722b is not running
-------------------------------------------------------------------------------------------------------------------------------------------
sudo docker run --name vibhutic1 -d alpine ping google.com
sudo docker ps
sudo docker kill vibhutic1
sudo docker ps
sudo docker start vibhutic1
sudo docker ps
-------------------------------------------------------------------------------------------------------------------------------------------
sudo docker run -d --name vibhutic2 alpine ping 8.8.8.8
sudo docker ps
uname -r
uname
sudo docker exec vibhutic2 cal
sudo docker ps
sudo docker exec -it vibhutic2 sh
sudo docker ps
sudo kill vibhutic2
sudo docker kill vibhutic2
sudo docker ps
history
-------------------------------------------------------------------------------------------------------------------------------------------
sudo docker run -d --name vibhuti oraclelinux bash
sudo docker ps
sudo docker run -itd --name vibhuti oraclelinux bash
sudo docker rm vibhuti
sudo docker run -itd --name vibhuti oraclelinux bash
sudo docker run -itd --name vibhuti2 oraclelinux bash
sudo docker exec -it vibhuti bash
sudo docker exec -it vibhuti2 bash
-------------------------------------------------------------------------------------------------------------------------------------------
import time

while 4 > 2 :
	print(“Hello Oracle”)
	time.sleep(2)
	print(“Thanks Docker”)
	time.sleep(1)

[vibhuti@ip-172-31-39-204 pythoncode]$ cat Dockerfile 
FROM python
# from will pull python docker image from docker hub
COPY vibhuti.py /tmp/vibhuti.py
# copy from host to docker image
CMD python /tmp/vibhuti.py
# this will be default parent process

[vibhuti@ip-172-31-39-204 pythoncode]$ sudo docker build -t vibhuti:pyv1 .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM python
 ---> f88b2f81f83a
Step 2/3 : COPY vibhuti.py /tmp/vibhuti.py
 ---> ae66eea10d18
Step 3/3 : CMD python /tmp/vibhuti.py
 ---> Running in dae184843ff1
Removing intermediate container dae184843ff1
 ---> 14a41b3a53cf
Successfully built 14a41b3a53cf
Successfully tagged vibhuti:pyv1
[vibhuti@ip-172-31-39-204 pythoncode]$ ls
Dockerfile  vibhuti.py
[vibhuti@ip-172-31-39-204 pythoncode]$ docker images
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get http://%2Fvar%2Frun%2Fdocker.sock/v1.39/images/json: dial unix /var/run/docker.sock: connect: permission denied
[vibhuti@ip-172-31-39-204 pythoncode]$ sudo docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
veer                  pyv1                7d9223e07b81        3 seconds ago       933MB
gul007                pythonv1            9e2bfef231a9        6 seconds ago       933MB
ksreehar              pyv1                1f02dc3ca0de        10 seconds ago      933MB
a                     pyv1                a3fd64d7b214        10 seconds ago      933MB
rishi                 pyv1                9ebb8030f0e7        12 seconds ago      933MB
ajtest                pyv1                2fa35616bda4        15 seconds ago      933MB
vibhuti               pyv1                14a41b3a53cf        15 seconds ago      933MB
ashu                  pyv1                2a3385c1bcbc        19 seconds ago      933MB
python                latest              f88b2f81f83a        4 days ago          933MB
mysql                 latest              c8ad2be69a22        4 days ago          465MB
node                  latest              e0e011be5f0f        5 days ago          942MB
oracle/nosql          latest              e6e5996d8436        10 days ago         539MB
oraclelinux           latest              3e27ddc05b59        4 weeks ago         232MB
alpine                latest              e7d92cdc71fe        6 weeks ago         5.59MB
centos                latest              470671670cac        6 weeks ago         237MB
truevoly/oracle-12c   latest              21789d4d876f        13 months ago       5.7GB
hello-world           latest              fce289e99eb9        14 months ago       1.84kB
java                  latest              d23bdf5b1b1b        3 years ago         643MB
-------------------------------------------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ ls
oracle.jpg  vibhuti.html
[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ cat vibhuti.html 
<html>
	<body>
		<h1> Hello Oracle with Docker </h1>
		<img src="oracle.jpg">
		<h2>Welcome to Containerised web-app. </h2>
	</body>
</html>

[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ cat VibhutiDockerFile 
FROM fedora
#this will pull from docker hub if not present locally
MAINTAINER vibhuti.agarwal@oracle.com
# docker image author
RUN yum install httpd -y
# it will create container and install httpd and then merge into fedora
WORKDIR /var/www/html
# to change dir in the container
COPY . .
# this will copy all current source files to target 
EXPOSE 80 
#port for httpd web server
ENTRYPOINT httpd -DFOREGROUND
# this will start https daemon

[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ ls -a
.  ..  .dockerignore  VibhutiDockerFile  oracle.jpg  vibhuti.html
[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ cat .dockerignore 
#give files which shouldn't be considered in execute cmd
VibhutiDockerFile
.dockerignore

[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ sudo docker build -f VibhutiDockerFile -t vibhuti:webappv1 .
Sending build context to Docker daemon  10.75kB
Step 1/7 : FROM fedora
 ---> 536f3995adeb
Step 2/7 : MAINTAINER vibhuti.agarwal@oracle.com
 ---> Running in cd90792e5167
Removing intermediate container cd90792e5167
 ---> 07fde8a3a631
Step 3/7 : RUN yum install httpd -y
 ---> Running in e2e05d67737e
Fedora Modular 31 - x86_64                      6.3 MB/s | 5.2 MB     00:00    
Fedora Modular 31 - x86_64 - Updates            2.4 MB/s | 4.0 MB     00:01    
Fedora 31 - x86_64 - Updates                     11 MB/s |  21 MB     00:01    
Fedora 31 - x86_64                              7.6 MB/s |  71 MB     00:09    
Last metadata expiration check: 0:00:01 ago on Mon Mar  2 11:03:50 2020.
Dependencies resolved.
================================================================================
 Package                  Architecture Version              Repository     Size
================================================================================
Installing:
 httpd                    x86_64       2.4.41-12.fc31       updates       1.4 M
Installing dependencies:
 apr                      x86_64       1.7.0-2.fc31         fedora        124 k
 apr-util                 x86_64       1.6.1-11.fc31        fedora         98 k
 fedora-logos-httpd       noarch       30.0.2-3.fc31        fedora         16 k
 httpd-filesystem         noarch       2.4.41-12.fc31       updates        15 k
 httpd-tools              x86_64       2.4.41-12.fc31       updates        84 k
 mailcap                  noarch       2.1.48-6.fc31        fedora         31 k
 mod_http2                x86_64       1.15.3-2.fc31        fedora        158 k
Installing weak dependencies:
 apr-util-bdb             x86_64       1.6.1-11.fc31        fedora         13 k
 apr-util-openssl         x86_64       1.6.1-11.fc31        fedora         16 k

Transaction Summary
================================================================================
Install  10 Packages

Total download size: 1.9 M
Installed size: 5.9 M
Downloading Packages:
(1/10): httpd-tools-2.4.41-12.fc31.x86_64.rpm   285 kB/s |  84 kB     00:00    
(2/10): httpd-filesystem-2.4.41-12.fc31.noarch.  47 kB/s |  15 kB     00:00    
(3/10): httpd-2.4.41-12.fc31.x86_64.rpm         3.9 MB/s | 1.4 MB     00:00    
(4/10): apr-1.7.0-2.fc31.x86_64.rpm             2.5 MB/s | 124 kB     00:00    
(5/10): apr-util-1.6.1-11.fc31.x86_64.rpm       2.3 MB/s |  98 kB     00:00    
(6/10): apr-util-bdb-1.6.1-11.fc31.x86_64.rpm   1.1 MB/s |  13 kB     00:00    
(7/10): apr-util-openssl-1.6.1-11.fc31.x86_64.r 863 kB/s |  16 kB     00:00    
(8/10): fedora-logos-httpd-30.0.2-3.fc31.noarch 810 kB/s |  16 kB     00:00    
(9/10): mailcap-2.1.48-6.fc31.noarch.rpm        4.2 MB/s |  31 kB     00:00    
(10/10): mod_http2-1.15.3-2.fc31.x86_64.rpm      14 MB/s | 158 kB     00:00    
--------------------------------------------------------------------------------
Total                                           2.7 MB/s | 1.9 MB     00:00     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1 
  Installing       : apr-1.7.0-2.fc31.x86_64                               1/10 
  Installing       : apr-util-bdb-1.6.1-11.fc31.x86_64                     2/10 
  Installing       : apr-util-openssl-1.6.1-11.fc31.x86_64                 3/10 
  Installing       : apr-util-1.6.1-11.fc31.x86_64                         4/10 
  Installing       : httpd-tools-2.4.41-12.fc31.x86_64                     5/10 
  Installing       : mailcap-2.1.48-6.fc31.noarch                          6/10 
  Installing       : fedora-logos-httpd-30.0.2-3.fc31.noarch               7/10 
  Running scriptlet: httpd-filesystem-2.4.41-12.fc31.noarch                8/10 
  Installing       : httpd-filesystem-2.4.41-12.fc31.noarch                8/10 
  Installing       : mod_http2-1.15.3-2.fc31.x86_64                        9/10 
  Installing       : httpd-2.4.41-12.fc31.x86_64                          10/10 
  Running scriptlet: httpd-2.4.41-12.fc31.x86_64                          10/10 
  Verifying        : httpd-2.4.41-12.fc31.x86_64                           1/10 
  Verifying        : httpd-filesystem-2.4.41-12.fc31.noarch                2/10 
  Verifying        : httpd-tools-2.4.41-12.fc31.x86_64                     3/10 
  Verifying        : apr-1.7.0-2.fc31.x86_64                               4/10 
  Verifying        : apr-util-1.6.1-11.fc31.x86_64                         5/10 
  Verifying        : apr-util-bdb-1.6.1-11.fc31.x86_64                     6/10 
  Verifying        : apr-util-openssl-1.6.1-11.fc31.x86_64                 7/10 
  Verifying        : fedora-logos-httpd-30.0.2-3.fc31.noarch               8/10 
  Verifying        : mailcap-2.1.48-6.fc31.noarch                          9/10 
  Verifying        : mod_http2-1.15.3-2.fc31.x86_64                       10/10 

Installed:
  apr-1.7.0-2.fc31.x86_64                 apr-util-1.6.1-11.fc31.x86_64        
  apr-util-bdb-1.6.1-11.fc31.x86_64       apr-util-openssl-1.6.1-11.fc31.x86_64
  fedora-logos-httpd-30.0.2-3.fc31.noarch httpd-2.4.41-12.fc31.x86_64          
  httpd-filesystem-2.4.41-12.fc31.noarch  httpd-tools-2.4.41-12.fc31.x86_64    
  mailcap-2.1.48-6.fc31.noarch            mod_http2-1.15.3-2.fc31.x86_64       

Complete!
Removing intermediate container e2e05d67737e
 ---> e3311b0a6479
Step 4/7 : WORKDIR /var/www/html
 ---> Running in eb0cb55b8156
Removing intermediate container eb0cb55b8156
 ---> ae09b6d220ba
Step 5/7 : COPY . .
 ---> be317111f4d8
Step 6/7 : EXPOSE 80
 ---> Running in 24a0b8e01e07
Removing intermediate container 24a0b8e01e07
 ---> 8d0c3218a70f
Step 7/7 : ENTRYPOINT httpd -DFOREGROUND
 ---> Running in 85f9ef96703d
Removing intermediate container 85f9ef96703d
 ---> 56f9f92f32cd
Successfully built 56f9f92f32cd
Successfully tagged vibhuti:webappv1


[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ sudo docker images | grep vibhuti
vibhuti               webappv1            56f9f92f32cd        About a minute ago   430MB
vibhuti               pyv3                ce5e86e0a46c        42 minutes ago       933MB
vibhuti               pyv2                06aa443b0499        About an hour ago    933MB
vibhuti               pyv1                14a41b3a53cf        About an hour ago    933MB
[vibhuti@ip-172-31-39-204 vibhutiwebapp]$ sudo docker history vibhuti:webappv1
IMAGE               CREATED              CREATED BY                                      SIZE                COMMENT
56f9f92f32cd        About a minute ago   /bin/sh -c #(nop)  ENTRYPOINT ["/bin/sh" "-c…   0B                  
8d0c3218a70f        About a minute ago   /bin/sh -c #(nop)  EXPOSE 80                    0B                  
be317111f4d8        About a minute ago   /bin/sh -c #(nop) COPY dir:0e855e8175202985c…   6.07kB              
ae09b6d220ba        About a minute ago   /bin/sh -c #(nop) WORKDIR /var/www/html         0B                  
e3311b0a6479        About a minute ago   /bin/sh -c yum install httpd -y                 237MB               
07fde8a3a631        4 minutes ago        /bin/sh -c #(nop)  MAINTAINER vibhuti.agarwa…   0B                  
536f3995adeb        10 days ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
<missing>           10 days ago          /bin/sh -c #(nop) ADD file:a9b09cf691b550910…   193MB               
<missing>           5 months ago         /bin/sh -c #(nop)  ENV DISTTAG=f31-updates-c…   0B                  
<missing>           13 months ago        /bin/sh -c #(nop)  LABEL maintainer=Clement …   0B       

