FROM openjdk:8-jdk
EXPOSE 8093
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY target/spring-boot-admin-0.0.1-SNAPSHOT.jar /opt/app
COPY elastic-apm-agent-1.2.0.jar /opt/app
CMD java -javaagent:/opt/app/elastic-apm-agent-1.2.0.jar -jar spring-boot-admin-0.0.1-SNAPSHOT.jar
