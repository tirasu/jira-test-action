FROM ubuntu:18.04

MAINTAINER Tiramisu Web Apps http://www.tirasu.com/

# Update the package index
RUN apt-get -y update

# Set up Java environment
RUN apt-get -y install default-jre
RUN apt-get -y install default-jdk

COPY . .
COPY entrypoint.sh /entrypoint.sh

# Set up Atlassian SDK
RUN dpkg -i atlassian-plugin-sdk_8.0.16_all.deb;

# Set up environment variables
ENV JAVA_HOME /usr/lib/jvm/default-java
ENV M2_HOME /usr/share/atlassian-plugin-sdk-8.0.16/apache-maven-3.5.4/bin
ENV ATLAS_HOME /usr/share/atlassian-plugin-sdk-8.0.16/bin
ENV PATH ${PATH}:${M2_HOME}:${ATLAS_HOME}

RUN mvn install:install-file -DgroupId=jta -DartifactId=jta -Dversion=1.0.1 -Dpackaging=jar -Dfile=jta-1.0.1.jar
RUN mvn install:install-file -DgroupId=jndi -DartifactId=jndi -Dversion=1.2.1 -Dpackaging=jar -Dfile=jndi-1.2.1.jar

RUN sed -i -e 's/\r//g' /entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
