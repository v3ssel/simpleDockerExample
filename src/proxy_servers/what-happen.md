# what happen?

`docker-compose build` built **server** from the server folder and the nginx image with the new proxy **nginx.conf**

`docker-compose up` ran the two dependent containers

then, when we go to *http://localhost:80*, first, the port-forwarding redirects us to port 8080, which listens to the **nginx** container,

then, that container redirects us to **server** port 81, and finally, that port will redirects us to port 80 of **server**.

## P.S. To stop - press *Ctrl + C*, to delete - input `docker-compose rm` and press *y*
