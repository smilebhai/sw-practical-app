# Use the standard Nginx image from Docker Hub
FROM nginx

RUN apt-get update \
    && apt-get install -y openssl \
    && openssl req \
      -x509 \
      -subj "/C=US/ST=MD/L=Bowie/O=Home/CN=issquared.com" \
      -nodes \
      -days 365 \
      -newkey rsa:2048 \
      -keyout /etc/ssl/private/nginx-selfsigned.key \
      -out /etc/ssl/certs/nginx-selfsigned.crt

# Copy the configuration file from the current directory and paste
# it inside the container to use it as Nginx's default config.
COPY nginx.conf /etc/nginx/nginx.conf

# Port 80 443 of the container will be exposed
# This way we'll be able to access the server via localhost:8080 on our host.

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
