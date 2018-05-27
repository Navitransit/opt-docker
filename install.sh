#!/bin/bash

mkdir -p otp
wget -O otp/otp.jar https://repo1.maven.org/maven2/org/opentripplanner/otp/1.2.0/otp-1.2.0-shaded.jar

mkdir -p otp/scripting
mkdir -p otp/graphs
mkdir -p otp/graphs/dk
wget -O otp/graphs/dk/ddot.zip https://navitia.opendatasoft.com/explore/dataset/dk/files/ec2e817b5b7462f54dc0f93793638ea5/download/ && \
wget -O otp/graphs/dk/dk.osm.pbf  https://download.geofabrik.de/europe/denmark-latest.osm.pbf

java -Xmx2G -jar otp/otp.jar --build otp/graphs/dk --graphs otp/graphs/dk

nohup java -Xmx2G -jar /var/otp/otp.jar --server --router dk --analyst --port 5454 2>> /dev/null >> /dev/null &
