#!/bin/bash

set -x

# use command submin
app_name="${APP_NAME:-root}"
svn_url="${SVN_URL}"
svn_user="${SVN_USER:-svn}"
svn_pwd="${SVN_PWD:-123}"

mkdir -p /www/${app_name}

echo -e "yes"|svn co --username=${svn_user} --password=${svn_pwd} ${svn_url}  /www/${app_name}

mkdir /run/nginx

echo "server {
	listen 80 default_server;
	listen [::]:80 default_server;
	index index.html index.htm;
    root /www/${app_name};
}">/etc/nginx/conf.d/default.conf

nginx

tail -f /var/log/nginx/access.log 
#/bin/bash