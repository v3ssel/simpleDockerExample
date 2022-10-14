# what happen?

`docker build -t hello_image:1.0 .`  == 
`docker build -t <name\>:<tag/version> <where (. - means right here)>`

`docker run -d -p 80:80 -p 81:81 --name hello_container hello_image` == 
`docker run -d -p <local port>:<container port> --name <container name> <image name>`

**-p -- means that the local port now shows the output of the container port**

**--name -- sets the name of the container**

When we go to *http://localhost:80/*, **nginx** redirects us to the fastcgi server running the hello program

When we go to *http://localhost:80/status*, we see the nginx server status

When we go to *http://localhost:81/*, **proxy_pass** redirects us to port 80