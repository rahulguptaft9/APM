FROM openjdk:8-jdk
EXPOSE 8080
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY spring-boot-admin-0.0.1-SNAPSHOT /opt/app
RUN wget -O apm-agent.jar https://search.maven.org/remotecontent?filepath=co/elastic/apm/elastic-apm-agent/1.2.0/elastic-apm-agent-1.2.0.jar
CMD java -javaagent:/opt/app/apm-agent.jar -jar $JAR_NAME
