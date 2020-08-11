FROM openjdk:11.0.3-jre-slim-stretch
VOLUME /tmp2
ADD target/spring9-petclinic9-*.jar /petclinic.jar
EXPOSE 8080
RUN bash -c 'touch/petclinic.jar'
ENTRYPOINT ["java","-jar","/petclinic.jar"]
