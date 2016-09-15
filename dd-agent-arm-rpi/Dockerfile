FROM osrf/ubuntu_armhf:xenial

MAINTAINER Datadog <m.auso.p@gmail.com>

# Base system

# Install the Agent
RUN echo "deb http://apt.datadoghq.com/ stable main" > /etc/apt/sources.list.d/datadog.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7A7DA52 \
 && apt-get update \
 && apt-get -y upgrade \
 && apt-get -y install apt-utils


RUN apt-get -y install sysstat curl python python-pip vim

RUN DD_START_AGENT=0 DD_API_KEY=b3ebf2106f0727e579cc3a787f26ec21 sh -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/setup_agent.sh)"


# Configure the Agent
# 1. Listen to statsd from other containers
# 2. Turn syslog off
# 3. Remove dd-agent user from supervisor configuration
# 4. Remove dd-agent user from init.d configuration
# 5. Fix permission on /etc/init.d/datadog-agent
# 6. Remove network check
# 7. Symlink Dogstatsd to allow standalone execution
RUN  mv ~/.datadog-agent/agent/datadog.conf.example ~/.datadog-agent/agent/datadog.conf \
 && sed -i -e"s/^.*non_local_traffic:.*$/non_local_traffic: yes/" ~/.datadog-agent/agent/datadog.conf \
 && sed -i -e"s/^.*log_to_syslog:.*$/log_to_syslog: no/" ~/.datadog-agent/agent/datadog.conf \
# && sed -i "/user=dd-agent/d" ~/.datadog-agent/supervisord/supervisord.conf \
# && sed -i 's/AGENTUSER="dd-agent"/AGENTUSER="root"/g' /etc/init.d/datadog-agent \
# && chmod +x /etc/init.d/datadog-agent \
 && rm ~/.datadog-agent/agent/conf.d/network.yaml.default \
 && ln -s /opt/datadog-agent/agent/dogstatsd.py /usr/bin/dogstatsd

# Add Docker check
COPY conf.d/docker_daemon.yaml ~/.datadog-agent/agent/conf.d/docker_daemon.yaml

COPY entrypoint.sh /entrypoint.sh

CMD mkdir -p /conf.d 

# Extra conf.d and checks.d
VOLUME ["/conf.d", "/checks.d"]

# Expose DogStatsD
EXPOSE 8125/udp 

ENTRYPOINT ["/entrypoint.sh"]
CMD  ~/.datadog-agent/bin/agent start
