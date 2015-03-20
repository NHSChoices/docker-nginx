# nxingx Proxy for Neo4j

## Overview
The main purpose of this docker configuration is to have a nginx proxy in front of a couple of Neo4j instances. nginx will act as a load balancer and Neo4j clients will
only need the nginx address to connect.

## How to build
Building the docker image is really ease. Check out the repository, build the image and run it. There are a couple expectations, this container makes:

+ The Neo4j instances run also in Docker containers
+ All Neo4j containers are linked to this container. So no external TCP traffic is made - it will happen within Docker infrastructure only.
+ The hostname, nginx will serve the requests from, is configured via `-e NEO4J_HOSTNAME=<hostname>`

Here are the steps as shell commands:
```bash
git clone git@github.com:daincredibleholg/docker-nginx.git
cd docker-nginx
sudo docker build -t daincredibleholg/docker-nginx .
sudo docker run -itd --privileged -e NEO4J_HOSTNAME=neo4j.steinhauer.technology --link neo4j:neo4jn1 -p 7474:7474 --name nginx-neo4j-router daincredibleholg/nginx-neo4j-lb
```
The last command expects an existing Docker container with name _neo4j_ to be available.

## About this Repo
This is a fork of the [official Docker image](https://github.com/nginxinc/docker-nginx) for [nginx](https://registry.hub.docker.com/_/nginx/).
