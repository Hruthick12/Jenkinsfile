#!/bin/bash
cd /var/lib/jenkins/practice
aws s3 cp s3://jenkins-test-9/java_build/sample-hello-world-0.2.0.jar .
scp sample-hello-world-0.2.0.jar ec2-user@10.0.0.183:/home/ec2-user/tomcat/apache-tomcat-9.0.74/webapps
ssh ec2-user@10.0.0.183 << HERE
    cd /home/ecr-user/tomcat/apache-tomcat-9.0.74/bin/
    ./shutdown.sh
    ./startup.sh
HERE
