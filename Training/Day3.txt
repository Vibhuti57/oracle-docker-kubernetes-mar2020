[vibhuti@ip-172-31-39-204 ~]$ systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2020-03-04 04:34:18 UTC; 22min ago
     Docs: https://docs.docker.com
  Process: 4338 ExecStartPre=/usr/libexec/docker/docker-setup-runtimes.sh (code=exited, status=0/SUCCESS)
  Process: 4243 ExecStartPre=/bin/mkdir -p /run/docker (code=exited, status=0/SUCCESS)
 Main PID: 4420 (dockerd)
    Tasks: 14
   Memory: 105.0M
   CGroup: /system.slice/docker.service
           └─4420 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --default-ulimit nof...

[vibhuti@ip-172-31-39-204 ~]$ docker compose -v
Docker version 18.09.9-ce, build 039a7df

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 ~]$ mkdir vibday3app1
[vibhuti@ip-172-31-39-204 ~]$ cd vibday3app1/
[vibhuti@ip-172-31-39-204 vibday3app1]$ git clone https://github.com/microsoft/project-html-website
Cloning into 'project-html-website'...
remote: Enumerating objects: 19, done.
remote: Total 19 (delta 0), reused 0 (delta 0), pack-reused 19
Unpacking objects: 100% (19/19), done.
[vibhuti@ip-172-31-39-204 vibday3app1]$ ls
project-html-website

[vibhuti@ip-172-31-39-204 vibday3app1]$ vim docker-compose.yml
[vibhuti@ip-172-31-39-204 vibday3app1]$ cat docker-compose.yml 
version: '3.7'
services:
 vibwebapp:
  image: alpine
  container_name: vibc99
  command: ping google.com

[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose up
Creating network "vibday3app1_default" with the default driver
Creating vibc99 ... done
Attaching to vibc99
vibc99       | PING google.com (172.217.9.206): 56 data bytes
vibc99       | 64 bytes from 172.217.9.206: seq=0 ttl=47 time=1.412 ms
vibc99       | 64 bytes from 172.217.9.206: seq=1 ttl=47 time=2.836 ms
vibc99       | 64 bytes from 172.217.9.206: seq=2 ttl=47 time=1.414 ms
vibc99       | 64 bytes from 172.217.9.206: seq=3 ttl=47 time=1.418 ms
vibc99       | 64 bytes from 172.217.9.206: seq=4 ttl=47 time=1.485 ms
vibc99       | 64 bytes from 172.217.9.206: seq=5 ttl=47 time=1.420 ms
vibc99       | 64 bytes from 172.217.9.206: seq=6 ttl=47 time=1.391 ms
vibc99       | 64 bytes from 172.217.9.206: seq=7 ttl=47 time=2.628 ms
vibc99       | 64 bytes from 172.217.9.206: seq=8 ttl=47 time=1.472 ms
vibc99       | 64 bytes from 172.217.9.206: seq=9 ttl=47 time=1.402 ms
vibc99       | 64 bytes from 172.217.9.206: seq=10 ttl=47 time=1.505 ms
^CGracefully stopping... (press Ctrl+C again to force)
Stopping vibc99 ... 
Killing vibc99  ... done

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose up -d
Starting vibc99 ... done
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose ps
 Name        Command       State   Ports
----------------------------------------
vibc99   ping google.com   Up           
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose stop
Stopping vibc99 ... done
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose ps
 Name        Command        State     Ports
-------------------------------------------
vibc99   ping google.com   Exit 137        
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose start
Starting vibwebapp ... done
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose ps
 Name        Command       State   Ports
----------------------------------------
vibc99   ping google.com   Up           
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose kill
Killing vibc99 ... done

---------------------------------------------------------------------------------------------------------
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose logs
Attaching to vibc99
vibc99       | PING google.com (172.217.9.206): 56 data bytes
vibc99       | 64 bytes from 172.217.9.206: seq=0 ttl=47 time=1.412 ms
vibc99       | 64 bytes from 172.217.9.206: seq=1 ttl=47 time=1.505 ms
vibc99       | 64 bytes from 172.217.9.206: seq=15 ttl=47 time=1.626 ms
vibc99       | PING google.com (172.217.9.206): 56 data bytes
vibc99       | 64 bytes from 172.217.9.206: seq=0 ttl=47 time=1.381 ms
vibc99       | 64 bytes from 172.217.9.206: seq=1 ttl=47 time=1.477 ms
vibc99       | 64 bytes from 172.217.9.206: seq=60 ttl=47 time=1.531 ms
vibc99       | PING google.com (172.217.8.14): 56 data bytes
vibc99       | 64 bytes from 172.217.8.14: seq=0 ttl=47 time=1.931 ms
vibc99       | 64 bytes from 172.217.8.14: seq=1 ttl=47 time=1.608 ms
vibc99       | 64 bytes from 172.217.8.14: seq=7 ttl=47 time=1.608 ms
---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose up -d
Starting vibc99 ... done
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose down
Stopping vibc99 ... done
Removing vibc99 ... done
Removing network vibday3app1_default

---------------------------------------------------------------------------------------------------------

[vibhuti@ip-172-31-39-204 vibday3app1]$ vim docker-compose.yml 
[vibhuti@ip-172-31-39-204 vibday3app1]$ cat docker-compose.yml 
version: '3.7'
services:
 vibwebapp:
  image: nginx
  container_name: vibc99
  volumes: 
   - "./project-html-website:/usr/share/nginx/html"
  ports:
   - "1157:80"

[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose up -d
Creating network "vibday3app1_default" with the default driver
Creating vibc99 ... done
[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose ps
 Name          Command          State          Ports        
------------------------------------------------------------
vibc99   nginx -g daemon off;   Up      0.0.0.0:1157->80/tcp

[vibhuti@ip-172-31-39-204 vibday3app1]$ docker-compose down
Stopping vibc99 ... done
Removing vibc99 ... done
Removing network vibday3app1_default

