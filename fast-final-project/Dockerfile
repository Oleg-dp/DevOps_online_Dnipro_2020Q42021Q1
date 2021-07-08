FROM openjdk:8-jdk-alpine
EXPOSE 8081

ARG JAR_FILE=target/*.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dserver.port=8081","-jar","/app.jar"]
