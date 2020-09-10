FROM openjdk:8-jre-slim


WORKDIR /opt/traccar

RUN set -ex && \
    apt-get update &&\
    TERM=xterm DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends unzip wget && \
    wget -qO /tmp/server-tracking.zip https://github.com/khiareddine123/server-tracking.git && \
    unzip -qo /tmp/sercer-tracking.zip -d /opt/server-tracking && \
    apt-get autoremove --yes unzip wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["java", "-Xms512m", "-Xmx512m", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "conf/traccar.xml"]
