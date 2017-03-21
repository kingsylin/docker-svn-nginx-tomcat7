#!/bin/bash

set -x

app_name="${APP_NAME:-project}"
build_file="${BUILD_FILE:-ROOT.war}"
build_cmd="${BUILD_CMD:-clean package -Dmaven.test.skip=true}"

echo "yes" | svn co --username=${SVN_USER} --password=${SVN_PWD}  ${SVN_URL} ${app_name}

cd ${app_name}

../maven/bin/mvn ${build_cmd}

cd ../

mv tomcat/webapps/ROOT tomcat/webapps/ROOT.bak

cp project/target/${build_file} tomcat/webapps

chmod +x tomcat/bin/catalina.sh

tomcat/bin/catalina.sh run
