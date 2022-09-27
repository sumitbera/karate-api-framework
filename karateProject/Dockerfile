FROM maven:3.6.0-jdk-11-slim 
USER root
WORKDIR /karate
COPY src /karate/src
COPY target /karate/target
COPY pom.xml ./
ENTRYPOINT mvn clean test