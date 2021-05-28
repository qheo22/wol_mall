FROM openjdk:8-jdk-alpine
ARG JAR_FILE=build/libs/*.jar
ADD ${JAR_FILE} the14-web-cryptoclass.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/the14-web-cryptoclass.jar"]