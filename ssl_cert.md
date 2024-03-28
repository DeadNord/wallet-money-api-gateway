sudo certbot certonly --nginx
nginx -s reload

curl -v https://wallet-money-api-gateway.fly.dev/api/auth/swagger

curl -v https://wallet-money-auth-service.fly.dev/api/auth/swagger