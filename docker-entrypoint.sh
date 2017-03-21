#!/bin/bash

set -x

app_name="${APP_NAME:-default}"
build_file="${BUILD_FILE:-ROOT.war}"
build_cmd="${BUILD_CMD:-clean package -Dmaven.test.skip=true}"

mkdir project

echo "yes" | svn co --username=${SVN_USER} --password=${SVN_PWD}  ${SVN_URL} project/${app_name}

cd  project/${app_name}

../../maven/bin/mvn ${build_cmd}

cd ../../

mv tomcat/webapps/ROOT tomcat/webapps/ROOT.bak

cp project/${app_name}/target/${build_file} tomcat/webapps

chmod +x tomcat/bin/catalina.sh

tomcat/bin/catalina.sh run
