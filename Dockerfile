FROM alpine:3.17.3
LABEL AUTHOR="navya"
LABEL EMAIL="mannepallinavya06@gmail.com"
# install java version
RUN apk add openjdk-17-jre
# create working directory for tomcat
WORKDIR /opt
# add tomcat9 link
ADD https://downloads.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz.asc
# unzip tomcat file
RUN tar xf apache-tomcat-9.0.73.tar.gz.asc
# remove zip file
RUN rm apache-tomcat-9.0.73.tar.gz.asc
# rename tomcat to tomcat9
RUN mv apache-tomcat-9.0.73 tomcat9
# copy war file from target folder to tomcat webapps folder
COPY target/hr-api.war /opt/tomcat9/webapps

EXPOSE 8080

CMD ["/opt/tomcat9/bin/catalina-sh", "run"]

