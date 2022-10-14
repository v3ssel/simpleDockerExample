# Docker Example

## Firstly, install docker

## Simple Docker Image
Go to the *server* folder and run `build.sh` via bash.

It built a docker image from a Dockerfile and started a container with a very simple Nginx + FastCGI web page.

Now in your browser go to *http://localhost:80/* or *http://localhost:81/* to see the result.

Or go to *http://localhost:80(1)/status* to see the Nginx server status.

To delete container and image run `remove.sh` via bash.

## Docker Proxy Server
Go to the *proxy_servers* folder and run `build_proxy.sh`.

Now you can see simple web pages at *http://localhost:80* or *http://localhost:80/status*.

This is an example of simple proxy with docker-compose.

We start on the local machine, goes to *http://localhost:80*, but on the way to the server we will go through several proxies:

*local:80 -> nginx:8080 -> server:81 -> server:80*

## P.S. *Server* and *proxy_servers* folders contains what-happen.md files
