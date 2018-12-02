FROM alpine/git AS clone 
WORKDIR /app
RUN git clone https://github.com/SSandeepg07/demowebapp.git

FROM maven:3.5-jdk-8-alpine AS build
WORKDIR /app
COPY --from=clone /app/demowebapp /app 
RUN mvn clean install

FROM tomcat:7-jre8
	
# PATH Setup
ENV CATALINA_BASE /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV CATALINA_TMPDIR /usr/local/tomcat/temp


COPY --from=build /app/target/demowebapp.war ${CATALINA_HOME}/webapps/
RUN echo "Building Your Own Application Container Image!"
# Port Setup
EXPOSE 8080

# Main Command
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
#RUN mv tomcat
#CMD ${CATALINA_HOME}/bin/startup



