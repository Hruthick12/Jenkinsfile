#!/bin/bash
tag=$1
env=$2

echo "environment is $env"
ls -lrtha
pwd
IP=`grep $env /var/lib/jenkins/workspace/java_deployment/shellscripts/env.properties | cut -d ':' -f2 |tr -d "[:space:]"`
echo "ip is $IP"

mkdir /var/lib/jenkins/deploy
cd /var/lib/jenkins/deploy
aws s3 cp s3://jenkins-test-9/java_build/$tag/sparkjava-hello-world-1.0.war .
scp sparkjava-hello-world-1.0.war ec2-user@${IP}:/home/ec2-user/tomcat/apache-tomcat-9.0.74/webapps
ssh ec2-user@${IP}   << HERE
    rm -rf /home/ec2-user/tomcat/apache-tomcat-9.0.74/work
    cd /home/ec2-user/tomcat/apache-tomcat-9.0.74/bin/
    ./shutdown.sh
    ./startup.sh
HERE
