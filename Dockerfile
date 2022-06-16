FROM openjdk:8-jdk
EXPOSE 8093
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY target/spring-boot-admin-0.0.1-SNAPSHOT.jar /opt/app
COPY elastic-apm-agent-1.2.0.jar /opt/app
CMD java -javaagent:/opt/app/elastic-apm-agent-1.2.0.jar -Delastic.apm.service_name=my-application -Delastic.apm.server_urls=http://10.210.0.102:8200 -Delastic.apm.environment=production -Delastic.apm.application_packages=org.example -jar spring-boot-admin-0.0.1-SNAPSHOT.jar
