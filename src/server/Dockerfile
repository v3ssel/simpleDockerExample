# Installing the nginx environment
FROM nginx

# Selecting a working directory
WORKDIR /home

# Copy main.c and nginx.conf into the docker container | COPY from where
COPY main.c .
COPY nginx.conf /etc/nginx/nginx.conf

# At the first start up of the container
RUN \
    # Install updates
    apt-get upgrade; \
    apt-get update; \
    # Install spawn-fcgi, the spawn-fcgi libraries and gcc compiler
    apt-get install -y spawn-fcgi libfcgi-dev gcc; \
    # Compile the main.c file with fcgi library
    gcc main.c -lfcgi -o hello.out; \
    rm -f main.c; \
    # Create a container user and make him the owner of the copied files
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    # Run nginx
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    # Protect important files
    chmod g-s /usr/bin/expiry; \
    chmod u-s /usr/bin/newgrp; \
    chmod g-s /usr/bin/chage; \
    chmod g-s /sbin/unix_chkpwd; \
    chmod u-s /bin/mount; \
    chmod g-s /usr/bin/wall; \
    chmod u-s /bin/su; \
    chmod u-s /usr/bin/passwd; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /bin/umount; \
    # Delete apt-get logs
    rm -rf /var/lib/apt/lists

# Set container user
USER nginx
# Make health check for container every 5 min, by checking the availability of http://localhost
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1
# On cointainer start, starts nginx and fcgi with hello program
ENTRYPOINT service nginx start && spawn-fcgi -p 8080 -n hello.out
