FROM openjdk:27-ea-oraclelinux8
COPY target/devops-automation.jar devops-automation.jar
ENTRYPOINT [ "java", "-jar", "devops-automation.jar" ]