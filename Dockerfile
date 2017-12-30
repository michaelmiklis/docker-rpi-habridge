FROM resin/raspberry-pi-openjdk:8-jdk

LABEL maintainer="Michael Miklis / <info@michaelmiklis.de>"

ENV  DEBIAN_FRONTEND noninteractive

RUN [ "cross-build-start" ]

# Install HAbridge from bwsystems's repository
RUN LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' https://github.com/bwssytems/ha-bridge/releases/latest) && \
    LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/' | sed 's/^.\{1\}//')  && \
    #
    # **************************
    # Download latest release
    # **************************
    mkdir /bridge && \
    cd /bridge && \
    curl -L -o /bridge/ha-bridge.jar https://github.com/bwssytems/ha-bridge/releases/download/v${LATEST_VERSION}/ha-bridge-${LATEST_VERSION}.jar && \
    #
    # **************************
    # Generate run.sh file
    # **************************
    touch /bridge/run.sh && \
    chmod +x /bridge/run.sh && \
    echo '#!/bin/bash' > /bridge/run.sh && \
    echo java -jar \$PORT \$KEY \$CONFIG \$IP \$GARDEN /bridge/ha-bridge.jar >> /bridge/run.sh

RUN [ "cross-build-end" ]

WORKDIR /bridge

CMD bash -C '/bridge/run.sh';'bash'
