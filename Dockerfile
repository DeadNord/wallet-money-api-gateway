FROM nginx:latest

# Установка зависимостей для envsubst (если не установлены)
RUN apt-get update && apt-get install -y gettext-base

# Установка рабочей директории в контейнере
WORKDIR /etc/nginx

# Создание директории logs
RUN mkdir -p /logs

# Удаление стандартных файлов конфигурации Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Копирование шаблонов и скриптов
COPY ./conf/nginx.conf.template ./nginx.conf.template
COPY ./conf/conf.d/ ./conf.d/
COPY replace_env.sh ./replace_env.sh

# Делаем скрипт исполняемым
RUN chmod +x ./replace_env.sh

# Запускаем скрипт замены переменных и Nginx
CMD ["/bin/sh", "-c", "./replace_env.sh && nginx -g 'daemon off;'"]
