FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get -yq install privoxy && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/privoxy/custom/
RUN echo "" >> /etc/privoxy/config
RUN echo "listen-address 0.0.0.0:8118" >> /etc/privoxy/config

EXPOSE 8118
ENTRYPOINT [ "privoxy", "--no-daemon" ]
CMD [ "/etc/privoxy/config" ]
