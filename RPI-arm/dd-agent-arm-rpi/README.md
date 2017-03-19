### Quick Start

Rememeber that you need put API_KEY, This image is ready-to-go

```bash
docker run -d --name dd-RPI -v /opt/dd-agent-conf.d:/conf.d:ro -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e API_KEY=Api-key -e DD_HOSTNAME=RPI maauso/dd-agent-arm-rpi:agent_only
```

## Configuration

This image doesn't has all configuration that you can find in official images, but you can use some of this

[Entryponit with options](https://github.com/maauso/docker/blob/master/dd-agent-arm-rpi/entrypoint.sh)

```DD_HOSTNAME```=  set the hostname (write it in datadog.conf)

```TAGS``` set host tags. Add -e TAGS="simple-tag-0,tag-key-1:tag-value-1" to use [simple-tag-0, tag-key-1:tag-value-1] as host tags.

```LOG_LEVEL``` set logging verbosity (CRITICAL, ERROR, WARNING, INFO, DEBUG). Add -e LOG_LEVEL=DEBUG to turn logs to debug mode.

## Build Details

[Source Repository](https://github.com/maauso/docker)

[Source Proyect](https://github.com/maauso/docker)

[DockerFile](https://github.com/maauso/docker/blob/master/dd-agent-arm-rpi/Dockerfile)

[DockerHub](https://hub.docker.com/r/maauso/dd-agent-arm-rpi/)

