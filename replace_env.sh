#!/bin/bash
# replace_env.sh


# Replace placeholders with environment variable values
sed -i "s|__NGINX_SERVER_HOST__|$NGINX_SERVER_HOST|g" /etc/nginx/nginx.conf.template
sed -i "s|__NGINX_SERVER_PORT__|$NGINX_SERVER_PORT|g" /etc/nginx/nginx.conf.template
sed -i "s|__FINANCES_SERVICE_HOST__|$FINANCES_SERVICE_HOST|g" /etc/nginx/nginx.conf.template
sed -i "s|__FINANCES_SERVICE_PORT__|$FINANCES_SERVICE_PORT|g" /etc/nginx/nginx.conf.template
sed -i "s|__AUTH_SERVICE_HOST__|$AUTH_SERVICE_HOST|g" /etc/nginx/nginx.conf.template
sed -i "s|__AUTH_SERVICE_PORT__|$AUTH_SERVICE_PORT|g" /etc/nginx/nginx.conf.template

# Move the final config into place
mv /etc/nginx/nginx.conf.template /etc/nginx/nginx.conf