#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install awscli
sudo apt install openjdk-11-jdk -y
sudo apt install tomcat9 tomcat9-admin tomcat9-docs tomcat9-common git -y

sudo systemctl stop tomcat9
sudo rm -Rf /var/lib/tomcat9/webapps/ROOT
sudo aws s3 cp s3://my-project-artifact-bucket/vprofile-v2.war /var/lib/tomcat9/webapps/ROOT.war
sudo systemctl start tomcat9