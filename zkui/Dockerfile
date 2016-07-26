FROM java:7
MAINTAINER Miguel Auso <miguel.auso@odigeo.com> https://github.com/maauso/docker.git
RUN apt-get update && apt-get install -y git maven
RUN git clone https://github.com/DeemOpen/zkui.git
RUN cd /zkui && mvn clean install
WORKDIR /zkui/target/
COPY config.cfg /zkui/target/
COPY entrypoint.sh /zkui/target/
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/zkui/target/entrypoint.sh"]
EXPOSE 9090
