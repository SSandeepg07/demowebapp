FROM alpine/git AS clone 
WORKDIR /app
RUN git clone https://github.com/SSandeepg07/demowebapp.git

FROM maven:3.5-jdk-8-alpine AS build
WORKDIR /app
COPY --from=clone /app/demowebapp /app 
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/demowebapp.war ${CATALINA_HOME}/webapps/
CMD ${CATALINA_HOME}/bin/startup



