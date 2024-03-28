FROM nginx:latest


RUN apt-get update
RUN apt-get install -y sudo
RUN sudo apt-get upgrade
RUN apt-get install -y tree
RUN sudo apt-get install -y iproute2
RUN sudo apt-get remove -y certbot
RUN sudo apt-get install -y certbot
RUN sudo apt-get install -y python3-certbot-nginx

# Установка рабочей директории в контейнере
WORKDIR /etc/nginx

# Создание директории logs
RUN mkdir -p /logs
RUN mkdir -p /var/www/letsencrypt

# Удаление стандартных файлов конфигурации Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копирование вашего нового конфигурационного файла и дополнительных конфигураций, если они есть
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/* /etc/nginx/conf.d/


COPY ./conf/conf.d/ssl/fullchain.pem /etc/letsencrypt/live/wallet-money-api-gateway.fly.dev/fullchain.pem
COPY ./conf/conf.d/ssl/privkey.pem /etc/letsencrypt/live/wallet-money-api-gateway.fly.dev/privkey.pem


# # # Запуск Nginx в фоновом режиме
CMD ["nginx", "-g", "daemon off;"]
