FROM openjdk:11.0.3-jre-slim-stretch
VOLUME /tmp2
ADD target/spring-petclinic-*.jar /petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/petclinic.jar"]
