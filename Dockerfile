# Using the official Nginx image as the base image
FROM nginx:latest

# Updating the package list
RUN apt-get update
# Installing the sudo utility
RUN apt-get install -y sudo
# Upgrading installed packages
RUN sudo apt-get upgrade -y
# Installing the tree utility for directory visualization
RUN apt-get install -y tree
# Installing process control utilities
RUN apt-get install -y procps
# Installing networking utilities
RUN sudo apt-get install -y iproute2
# Removing any existing certbot package
RUN sudo apt-get remove -y certbot
# Installing Certbot for Let's Encrypt SSL certificates
RUN sudo apt-get install -y certbot
# Installing Certbot Nginx plugin for easy SSL configuration
RUN sudo apt-get install -y python3-certbot-nginx
# Installing CA certificates and updating the CA certificate store
RUN sudo apt-get install -y ca-certificates && update-ca-certificates

# Setting the working directory inside the container
WORKDIR /etc/nginx

# Creating a directory for logs
RUN mkdir -p /logs
# Creating a directory for Let's Encrypt challenges
RUN mkdir -p /var/www/letsencrypt

# Removing the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copying your new Nginx configuration file and any additional configurations if they exist
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/* /etc/nginx/conf.d/

# Optional: Copying SSL certificates (uncomment if using custom certificates)
# COPY ./conf/conf.d/ssl/fullchain.pem /etc/letsencrypt/live/wallet-money-api-gateway.fly.dev/fullchain.pem
# COPY ./conf/conf.d/ssl/privkey.pem /etc/letsencrypt/live/wallet-money-api-gateway.fly.dev/privkey.pem

# Running Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
