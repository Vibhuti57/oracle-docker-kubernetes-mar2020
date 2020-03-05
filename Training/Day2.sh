[vibhuti@ip-172-31-39-204 mydockerimg3]$ vim Dockerfile 
[vibhuti@ip-172-31-39-204 mydockerimg3]$ cat Dockerfile 
FROM nginx
MAINTAINER vibhuti
RUN apt update -y && apt install git -y
WORKDIR /usr/share/nginx/html/
RUN git clone https://github.com/microsoft/project-html-website

[vibhuti@ip-172-31-39-204 mydockerimg3]$ sudo docker build -t vibnginx:webv1 .

[vibhuti@ip-172-31-39-204 mydockerimg3]$ sudo docker images | grep nginx
vibnginx              webv1               e8e6d81f5363        2 minutes ago        231MB

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 mydockerimg3]$ vim vibhuti.dockerfile
[vibhuti@ip-172-31-39-204 mydockerimg3]$ cat vibhuti.dockerfile 
FROM centos
ARG x=ftp
#dynamic variable that you can replace during build
RUN yum install $x -y

[vibhuti@ip-172-31-39-204 mydockerimg3]$ docker build -f vibhuti.dockerfile -t vibhuti:testv1 .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM centos
 ---> 470671670cac
Step 2/3 : ARG x=ftp
 ---> Using cache
 ---> 0e3f6de5137a
Step 3/3 : RUN yum install $x -y
 ---> Using cache
 ---> 714dba2466b8
Successfully built 714dba2466b8
Successfully tagged vibhuti:testv1
[vibhuti@ip-172-31-39-204 mydockerimg3]$ docker build -f vibhuti.dockerfile --build-arg x=telnet -t vibhuti:testv1 .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM centos
 ---> 470671670cac
Step 2/3 : ARG x=ftp
 ---> Using cache
 ---> 0e3f6de5137a
Step 3/3 : RUN yum install $x -y
 ---> Running in d9c07a421fe9
CentOS-8 - AppStream                             16 MB/s | 6.5 MB     00:00    
CentOS-8 - Base                                  16 MB/s | 5.0 MB     00:00    
CentOS-8 - Extras                                16 kB/s | 2.1 kB     00:00    
Dependencies resolved.
================================================================================
 Package        Architecture   Version                  Repository         Size
================================================================================
Installing:
 telnet         x86_64         1:0.17-73.el8            AppStream          72 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 72 k
Installed size: 123 k
Downloading Packages:
telnet-0.17-73.el8.x86_64.rpm                    12 MB/s |  72 kB     00:00    
--------------------------------------------------------------------------------
Total                                           351 kB/s |  72 kB     00:00     
warning: /var/cache/dnf/AppStream-02e86d1c976ab532/packages/telnet-0.17-73.el8.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
CentOS-8 - AppStream                            1.6 MB/s | 1.6 kB     00:00    
Importing GPG key 0x8483C65D:
 Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
 Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1 
  Installing       : telnet-1:0.17-73.el8.x86_64                            1/1 
  Running scriptlet: telnet-1:0.17-73.el8.x86_64                            1/1 
  Verifying        : telnet-1:0.17-73.el8.x86_64                            1/1 

Installed:
  telnet-1:0.17-73.el8.x86_64                                                   

Complete!
Removing intermediate container d9c07a421fe9
 ---> dc8ed7bab2de
Successfully built dc8ed7bab2de
Successfully tagged vibhuti:testv1

[vibhuti@ip-172-31-39-204 mydockerimg3]$ sudo docker run -it vibhuti:testv1 env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=caf5691c85cc
TERM=xterm
HOME=/root

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 mydockerimg3]$ vim vibhuti.dockerfile 
[vibhuti@ip-172-31-39-204 mydockerimg3]$ cat vibhuti.dockerfile 
FROM centos
ARG x=ftp
ENV c=hello
#dynamic variable that you can replace during build
RUN yum install $x -y
[vibhuti@ip-172-31-39-204 mydockerimg3]$ docker build -f vibhuti.dockerfile --build-arg x=telnet -t vibhuti:testv2 .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM centos
 ---> 470671670cac
Step 2/4 : ARG x=ftp
 ---> Using cache
 ---> 0e3f6de5137a
Step 3/4 : ENV c=hello
 ---> Using cache
 ---> fca357d3428e
Step 4/4 : RUN yum install $x -y
 ---> Using cache
 ---> d65a301fd88d
Successfully built d65a301fd88d
Successfully tagged vibhuti:testv2
[vibhuti@ip-172-31-39-204 mydockerimg3]$ sudo docker run -it vibhuti:testv2 env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=081f2666f296
TERM=xterm
c=hello
HOME=/root

[vibhuti@ip-172-31-39-204 mydockerimg3]$ vim vibhuti.dockerfile 
[vibhuti@ip-172-31-39-204 mydockerimg3]$ cat vibhuti.dockerfile 
FROM centos
ARG x=ftp
ENV c=$x
#dynamic variable that you can replace during build
RUN yum install $x -y
[vibhuti@ip-172-31-39-204 mydockerimg3]$ docker build -f vibhuti.dockerfile --build-arg x=telnet -t vibhuti:testv2 .
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM centos
 ---> 470671670cac
Step 2/4 : ARG x=ftp
 ---> Using cache
 ---> 0e3f6de5137a
Step 3/4 : ENV c=$x
 ---> Running in a8d8970e4891
Removing intermediate container a8d8970e4891
 ---> 7f1eb88f9fe3
Step 4/4 : RUN yum install $x -y
 ---> Running in 0d52a3190db9
CentOS-8 - AppStream                             25 MB/s | 6.5 MB     00:00    
CentOS-8 - Base                                  19 MB/s | 5.0 MB     00:00    
CentOS-8 - Extras                                21 kB/s | 2.1 kB     00:00    
Dependencies resolved.
================================================================================
 Package        Architecture   Version                  Repository         Size
================================================================================
Installing:
 telnet         x86_64         1:0.17-73.el8            AppStream          72 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 72 k
Installed size: 123 k
Downloading Packages:
telnet-0.17-73.el8.x86_64.rpm                   4.2 MB/s |  72 kB     00:00    
--------------------------------------------------------------------------------
Total                                           344 kB/s |  72 kB     00:00     
warning: /var/cache/dnf/AppStream-02e86d1c976ab532/packages/telnet-0.17-73.el8.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
CentOS-8 - AppStream                            1.6 MB/s | 1.6 kB     00:00    
Importing GPG key 0x8483C65D:
 Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
 Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1 
  Installing       : telnet-1:0.17-73.el8.x86_64                            1/1 
  Running scriptlet: telnet-1:0.17-73.el8.x86_64                            1/1 
  Verifying        : telnet-1:0.17-73.el8.x86_64                            1/1 

Installed:
  telnet-1:0.17-73.el8.x86_64                                                   

Complete!
Removing intermediate container 0d52a3190db9
 ---> 11e192a46b5e
Successfully built 11e192a46b5e
Successfully tagged vibhuti:testv2
[vibhuti@ip-172-31-39-204 mydockerimg3]$ sudo docker run -it vibhuti:testv2 env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=50e347045207
TERM=xterm
c=telnet
HOME=/root

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 day2]$ ls
mydockerimg3  webapp3
[vibhuti@ip-172-31-39-204 day2]$ git clone https://github.com/Vibhuti57/oraclewebappmarch3.git
Cloning into 'oraclewebappmarch3'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.

[vibhuti@ip-172-31-39-204 day2]$ ls
mydockerimg3  oraclewebappmarch3  webapp3

[vibhuti@ip-172-31-39-204 day2]$ cd oraclewebappmarch3/
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ ls
README.md
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ vim vibhuti.html 
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat vibhuti.html 
<html>
	<body>
		<h1> This is the default page for docker container. </h1>
		<img src="docker.png">
	</body>
</html>

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cp vibhuti.html red.html 
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cp vibhuti.html green.html
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ ls
README.md  green.html  red.html  vibhuti.html

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat red.html 
<html>
	<body bgcolor="red">
		<h1> This is the red default page for docker container. </h1>
		<img src="docker.png">
	</body>
</html>
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat green.html 
<html>
	<body bgcolor="green">
		<h1> This is the green color default page for docker container. </h1>
		<img src="docker.png">
	</body>
</html>

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ vim entrypt.sh
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat entrypt.sh 
#!/bin/bash

if [ "$color" == "black" ]

then
	cp /opt/vibhuti.html /var/www/html/index.html
	httpd -DFOREGROUND
elif [ "$color" == "red" ]
then
	cp /opt/red.html /var/www/html/index.html
	httpd -DFOREGROUND

elif [ "$color" == "green" ]
then 
	cp /opt/green.html /var/www/html/index.html
	httpd -DFOREGROUND

else
	echo "Sorry no color found" >> /var/www/html/index.html
	httpd -DFOREGROUND
fi

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ vim Dockerfile 
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat Dockerfile 
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
#execute script as shell

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ tree
.
|-- Dockerfile
|-- entrypt.sh
|-- green.html
|-- README.md
|-- red.html
|-- vibhuti.html

0 directories, 6 files

[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ vim .dockerignore
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ cat .dockerignore 
README.md
.dockerignore
.git
Dockerfile
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ git add .
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ git config user.email "agarwal.vibhuti57@gmail.com"
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ git config user.name "vibhuti57"
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ git commit -m " 3 webapps with version 1 "
[master 10d7f0d]  3 webapps with version 1
 6 files changed, 62 insertions(+)
 create mode 100644 .dockerignore
 create mode 100644 Dockerfile
 create mode 100644 entrypt.sh
 create mode 100644 green.html
 create mode 100644 red.html
 create mode 100644 vibhuti.html
[vibhuti@ip-172-31-39-204 oraclewebappmarch3]$ git push
Username for 'https://github.com': vibhuti57
Password for 'https://vibhuti57@github.com': 
Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 2 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 1.29 KiB | 1.29 MiB/s, done.
Total 8 (delta 0), reused 0 (delta 0)
To https://github.com/Vibhuti57/oraclewebappmarch3.git
   8a882f8..10d7f0d  master -> master

[vibhuti@ip-172-31-39-204 ~]$ docker build -t vibhutiwebapp:v1 https://github.com/Vibhuti57/oraclewebappmarch3.git

[vibhuti@ip-172-31-39-204 ~]$ sudo docker images | grep vibhuti
vibhutiwebapp       v1                  fddccd431f97        49 seconds ago       430MB

[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutiC1 -p 1157:80 vibhutiwebapp:v1
15d5171171aa2690b32833f5857dae1387560409c36b5cc759d6463a23687ded
[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutiC2 -p 1158:80 -e color=red vibhutiwebapp:v1
9b94fa092cfa0805b968d3b0a29ebc4d0323fc55e6a67761837f7eda3c87039d
[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutiC3 -p 1159:80 -e color=green vibhutiwebapp:v1
d661560a799492d46d4eb448e20cafdc879da93f9bb80af34181cea3ba08b301
[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutiC4 -p 1160:80 -e color=blue vibhutiwebapp:v1
4d5c03e87c3e442f0bb44075cda38d6704face73de223588567d37b5ab5f4d88
[vibhuti@ip-172-31-39-204 ~]$ docker ps | grep vibhuti
4d5c03e87c3e        vibhutiwebapp:v1    "/bin/bash /opt/entr…"   9 seconds ago        Up 7 seconds        0.0.0.0:1160->80/tcp   vibhutiC4
d661560a7994        vibhutiwebapp:v1    "/bin/bash /opt/entr…"   26 seconds ago       Up 25 seconds       0.0.0.0:1159->80/tcp   vibhutiC3
9b94fa092cfa        vibhutiwebapp:v1    "/bin/bash /opt/entr…"   43 seconds ago       Up 42 seconds       0.0.0.0:1158->80/tcp   vibhutiC2
15d5171171aa        vibhutiwebapp:v1    "/bin/bash /opt/entr…"   5 minutes ago        Up 5 minutes        0.0.0.0:1157->80/tcp   vibhutiC1

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ docker tag vibhutiwebapp:v1 vibhuti57/vibhutiwebapp:v1
[vibhuti@ip-172-31-39-204 ~]$ docker login -u vibhuti57
Password: 
WARNING! Your password will be stored unencrypted in /home/vibhuti/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[vibhuti@ip-172-31-39-204 ~]$ docker push vibhuti57/vibhutiwebapp:v1
The push refers to repository [docker.io/vibhuti57/vibhutiwebapp]
0a0b992abe92: Pushed 
d9e732b9d618: Pushing [==================================================>]  237.9MB
d9e732b9d618: Pushed 

v1: digest: sha256:88f97afaf9e623f75e36ec1c32e4693f4c9423f789322f877502b95ed9f71caf size: 949
[vibhuti@ip-172-31-39-204 ~]$ 
[vibhuti@ip-172-31-39-204 ~]$ docker logout
Removing login credentials for https://index.docker.io/v1/


[vibhuti@ip-172-31-39-204 ~]$ docker pull vibhuti57/vibhutiwebapp:v1

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ ifconfig docker0
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        inet6 fe80::42:fbff:fe09:38b3  prefixlen 64  scopeid 0x20<link>
        ether 02:42:fb:09:38:b3  txqueuelen 0  (Ethernet)
        RX packets 408472  bytes 22700224 (21.6 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1033792  bytes 2319543441 (2.1 GiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutic1 alpine sh
345bdbf4006289f1a4390bf62c9621738c8c424b6cd5de28cfecdc1cff9561cf
[vibhuti@ip-172-31-39-204 ~]$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
345bdbf40062        alpine              "sh"                8 seconds ago        Up 7 seconds                            vibhutic1
302bccc10519        alpine              "sh"                About a minute ago   Up About a minute                       c1
[vibhuti@ip-172-31-39-204 ~]$ docker exec vibhutic1 ifconfig
eth0      Link encap:Ethernet  HWaddr 02:42:AC:11:00:03  
          inet addr:172.17.0.3  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:11 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:810 (810.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 ~]$ docker network create vibhutibr --subnet 172.57.0.0/16
ca4cdc25654c6b73a52c471b3ac33fe260164dd8943e80ed04c8b4eee7f0f94d
[vibhuti@ip-172-31-39-204 ~]$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
d438b2153c72        ashubr              bridge              local
80e6156b231e        bridge              bridge              local
3dd35973b4ef        gulbr               bridge              local
319240578fc9        guribri             bridge              local
722baaf3aa1a        host                host                local
79bf5fd456fb        ksreehar3           bridge              local
6bf86b08744e        leobridge           bridge              local
43d49e0dccef        ls                  bridge              local
bc03d62b4455        namitbridge         bridge              local
382645dbea08        none                null                local
9342a58f2764        pravin              bridge              local
7e23462e0943        rishi               bridge              local
7a55756b3b92        veerbr              bridge              local
ca4cdc25654c        vibhutibr           bridge              local
[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutic11 --net vibhutibr alpine ping google.com
7d7b0366be99fa73ffe3b0adb0ebdf6dd78261d9155b9d7bcb156cae839561c8

[vibhuti@ip-172-31-39-204 ~]$ docker exec -it vibhutic11 ifconfig
eth0      Link encap:Ethernet  HWaddr 02:42:AC:39:00:02  
          inet addr:172.57.0.2  Bcast:172.57.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:137 errors:0 dropped:0 overruns:0 frame:0
          TX packets:117 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:12654 (12.3 KiB)  TX bytes:11018 (10.7 KiB)

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ docker volume ls
DRIVER              VOLUME NAME
local               ashuvol
local               fc699166f04c6da6bc2174b7295a3560e3f03aa73ba7e40b1787b877b4cc06ae
local               gulvol1
local               gurvol
local               ksreeharvol
local               namitvol
local               rishivol1
[vibhuti@ip-172-31-39-204 ~]$ docker volume create vibhutivol
vibhutivol
[vibhuti@ip-172-31-39-204 ~]$ docker volume ls
DRIVER              VOLUME NAME
local               ashuvol
local               fc699166f04c6da6bc2174b7295a3560e3f03aa73ba7e40b1787b877b4cc06ae
local               gulvol1
local               gurvol
local               ksreeharvol
local               namitvol
local               rishivol1
local               vibhutivol

[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutic55 -v vibhutivol:/mydata alpine sh
f382aea7aaac2e36850f8ee910dc7893de4d3062a65164729a43119001b10c04
[vibhuti@ip-172-31-39-204 ~]$ docker exec -it vibhutic55 sh
/ # ls
bin     dev     etc     home    lib     media   mnt     mydata  opt     proc    root    run     sbin    srv     sys     tmp     usr     var
/ # cd mydata/
/mydata # mkdir hello world
/mydata # ls
hello  world
/mydata # exit
[vibhuti@ip-172-31-39-204 ~]$ docker kill vibhutic55
vibhutic55
[vibhuti@ip-172-31-39-204 ~]$ docker rm vibhutic55
vibhutic55

[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibhutic77 -v vibhutivol:/ok alpine sh
adcef7032c5c1936ee2460f86e021283e911eb6900009eb7bda4c1b2a31267a8
[vibhuti@ip-172-31-39-204 ~]$ docker exec -it vibhutic77 sh
/ # ls
bin    dev    etc    home   lib    media  mnt    ok     opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # cd ok
/ok # ls
hello  world
/ok # exit


---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibwebapp -v vibhutivol:/myapps:ro alpine sh
c6b152cd39b6f7a9e278869597ccd3ccc45fb82c9b393f39448535c790591a51
[vibhuti@ip-172-31-39-204 ~]$ docker run -itd --name vibdb -v vibhutivol:/mydb:rw alpine sh
32a5fa11c2e12b63139bbcdf62754b8f9de27c39b59acbcf50ac81b168dfe1c7

[vibhuti@ip-172-31-39-204 ~]$ docker volume inspect vibhutivol
[
    {
        "CreatedAt": "2020-03-03T10:16:04Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/vibhutivol/_data",
        "Name": "vibhutivol",
        "Options": {},
        "Scope": "local"
    }
]

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 day2]$ cd pycode/
[vibhuti@ip-172-31-39-204 pycode]$ ls
test.py
[vibhuti@ip-172-31-39-204 pycode]$ cat test.py 
import time

while 3 > 2:
    print("Hello World!")
    time.sleep(1)
[vibhuti@ip-172-31-39-204 pycode]$ pwd
/home/vibhuti/day2/pycode
[vibhuti@ip-172-31-39-204 pycode]$ docker run -it --rm -v /home/vibhuti/day2/pycode/:/code python python /code/test.py
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
Hello World!
^XHello World!
Hello World!
Hello World!
^CTraceback (most recent call last):
  File "/code/test.py", line 5, in <module>
    time.sleep(1)
KeyboardInterrupt

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 day2]$ docker run -itd --name vibdb -e MYSQL_ROOT_PASSWORD=docker mysql 
63d0e010d51b691ea2d9191affe82096c1bcd6cd717412e921c5822db111bab6
[vibhuti@ip-172-31-39-204 day2]$ docker logs vibdb -f
2020-03-03 11:23:04+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.19-1debian9 started.
2020-03-03 11:23:04+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2020-03-03 11:23:04+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.19-1debian9 started.
2020-03-03 11:23:05+00:00 [Note] [Entrypoint]: Initializing database files
2020-03-03T11:23:05.054507Z 0 [Warning] [MY-010139] [Server] Changed limits: max_open_files: 1024 (requested 8161)
2020-03-03T11:23:05.054516Z 0 [Warning] [MY-010142] [Server] Changed limits: table_open_cache: 431 (requested 4000)
2020-03-03T11:23:05.054838Z 0 [Warning] [MY-011070] [Server] 'Disabling symbolic links using --skip-symbolic-links (or equivalent) is the default. Consider not using this option as it' is deprecated and will be removed in a future release.
2020-03-03T11:23:05.054956Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.19) initializing of server in progress as process 47
2020-03-03T11:23:09.534949Z 5 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2020-03-03 11:23:11+00:00 [Note] [Entrypoint]: Database files initialized
2020-03-03 11:23:11+00:00 [Note] [Entrypoint]: Starting temporary server
mysqld will log errors to /var/lib/mysql/63d0e010d51b.err
mysqld is running as pid 99
2020-03-03 11:23:12+00:00 [Note] [Entrypoint]: Temporary server started.
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.

2020-03-03 11:23:15+00:00 [Note] [Entrypoint]: Stopping temporary server
2020-03-03 11:23:17+00:00 [Note] [Entrypoint]: Temporary server stopped

2020-03-03 11:23:17+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2020-03-03T11:23:17.444340Z 0 [Warning] [MY-010139] [Server] Changed limits: max_open_files: 1024 (requested 8161)
2020-03-03T11:23:17.444346Z 0 [Warning] [MY-010142] [Server] Changed limits: table_open_cache: 431 (requested 4000)
2020-03-03T11:23:17.749672Z 0 [Warning] [MY-011070] [Server] 'Disabling symbolic links using --skip-symbolic-links (or equivalent) is the default. Consider not using this option as it' is deprecated and will be removed in a future release.
2020-03-03T11:23:17.749785Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.19) starting as process 1
2020-03-03T11:23:19.081525Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2020-03-03T11:23:19.084871Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2020-03-03T11:23:19.108522Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.19'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
2020-03-03T11:23:19.242680Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: '/var/run/mysqld/mysqlx.sock' bind-address: '::' port: 33060

[vibhuti@ip-172-31-39-204 day2]$ docker exec -it vibdb bash
root@63d0e010d51b:/# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 


---------------------------------------------------------------------------------------------------------
