FROM osrf/ubuntu_armhf:yakkety

RUN         set -x \
            && apt-get -qq update \
            && apt-get install -yq --no-install-recommends squid3 \
            && apt-get purge -y --auto-remove

ADD         entrypoint.sh ./
EXPOSE      3129
RUN         chmod 775 ./entrypoint.sh
ENTRYPOINT  ["./entrypoint.sh"]
