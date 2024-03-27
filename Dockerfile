FROM nginx:latest

# Установка зависимостей для envsubst (если не установлены)
RUN apt-get update && apt-get install -y gettext-base

# Установка рабочей директории в контейнере
WORKDIR /etc/nginx

# Создание директории logs
RUN mkdir -p /logs

# Удаление стандартных файлов конфигурации Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копирование вашего нового конфигурационного файла и дополнительных конфигураций, если они есть
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/conf.d/* /etc/nginx/conf.d/


# Запуск Nginx в фоновом режиме
CMD ["nginx", "-g", "daemon off;"]
