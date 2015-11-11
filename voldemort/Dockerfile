FROM java:7
MAINTAINER maauso
RUN apt-get update && apt-get install -y wget git
ENV VOLDEMORT_VERSION=release-1.10.13-cutoff
run git clone https://github.com/voldemort/voldemort.git
WORKDIR /voldemort/
RUN ./gradlew clean jar
EXPOSE 6666
CMD ./bin/voldemort-server.sh config/single_node_cluster/

