FROM ubuntu:14.04

# Set locale
RUN locale-gen --no-purge en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install dependencies
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y python-software-properties wget sudo net-tools

RUN apt-get update
RUN apt-get install -y vim  pbuilder python-mock python-configobj python-support cdbs python-psycopg2 git python-pip python-dev build-essential inetutils-ping curl
RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv

RUN git clone https://github.com/python-diamond/Diamond.git
RUN pip install librato-metrics
RUN pip install pysnmp-mibs
RUN pip install pysnmp
RUN pip install boto
RUN pip install psycopg2

WORKDIR /Diamond
RUN make builddeb
RUN sudo dpkg -i build/diamond_*_all.deb

RUN apt-get install -y supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN echo "Europe/Madrid" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata
RUN export LANGUAGE=en_US.UTF-8; export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8; locale-gen en_US.UTF-8; DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
ADD diamond.conf /etc/diamond/
ENTRYPOINT ["/usr/bin/supervisord"]
