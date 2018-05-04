#!/bin/sh

# create django folder
sudo mkdir -p /var/www/django
sudo chown -R ${whoami}:${whoami} /var/www/django
cd /var/www/django

# pip install
pip install Django
pip install django-filter
pip install djangorestframework
pip install mysqlclient
pip install PyMySQL
pip install pytz

# nginx
sudo yum install -y nginx

# write conf.d/app.conf as reverse proxy for :8000/app/
sudo echo 'server { ' > /etc/nginx/conf.d/app.conf
sudo echo '    server_name    localhost; ' >> /etc/nginx/conf.d/app.conf
sudo echo ' ' >> /etc/nginx/conf.d/app.conf
sudo echo '    proxy_set_header    Host    $host; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    proxy_set_header    X-Real-IP    $remote_addr; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    proxy_set_header    X-Forwarded-Host       $host; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    proxy_set_header    X-Forwarded-Server    $host; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    proxy_set_header    X-Forwarded-For    $proxy_add_x_forwarded_for; ' >> /etc/nginx/conf.d/app.conf
sudo echo ' ' >> /etc/nginx/conf.d/app.conf
sudo echo '    if ( $request_uri ~ "/app" ) { ' >> /etc/nginx/conf.d/app.conf
sudo echo '        set $not_ignore false; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    } ' >> /etc/nginx/conf.d/app.conf
sudo echo '    if ($not_ignore != false ) { ' >> /etc/nginx/conf.d/app.conf
sudo echo '        rewrite ^([^.]+[^/])$ $1/ permanent; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    } ' >> /etc/nginx/conf.d/app.conf
sudo echo ' ' >> /etc/nginx/conf.d/app.conf
sudo echo '    location /app/ { ' >> /etc/nginx/conf.d/app.conf
sudo echo '        proxy_pass    http://localhost:8000/app/; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    } ' >> /etc/nginx/conf.d/app.conf
sudo echo ' ' >> /etc/nginx/conf.d/app.conf
sudo echo '    location / { ' >> /etc/nginx/conf.d/app.conf
sudo echo '        proxy_pass    http://localhost:8000/; ' >> /etc/nginx/conf.d/app.conf
sudo echo '    } ' >> /etc/nginx/conf.d/app.conf
sudo echo '} ' >> /etc/nginx/conf.d/app.conf

# ログ出力先を作成
sudo mkdir -p /var/log/nginx
sudo chown -R nginx:nginx /var/log/nginx

# nginx自動起動
sudo systemctl enable nginx
sudo service nginx restart

