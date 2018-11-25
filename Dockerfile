FROM alpine/git AS clone 
WORKDIR /app
RUN git clone https://github.com/SSandeepg07/demowebapp.git

FROM maven:3.5-jdk-8-alpine AS build
WORKDIR /app
COPY --from=clone /app/demowebapp /app 
RUN mvn clean install

FROM containers.cisco.com/aws_managed/tomcat-8-jws3.1
EXPOSE 8080
WORKDIR /app
COPY --from=build /app/target/demowebapp.war ${JWS_HOME}/webapps/
CMD ${JWS_HOME}/bin/launch.sh



