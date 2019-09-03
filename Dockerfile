FROM ubuntu:16.04

RUN apt-get update
RUN apt-get --assume-yes install software-properties-common
RUN apt-get --assume-yes install curl
RUN apt-get --assume-yes install git
RUN apt-get --assume-yes install jq

ENV GOPATH /go
ENV HELM_HOME /helm
RUN mkdir /helm
RUN mkdir /helm/plugins

RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get update

RUN apt-get --assume-yes install ca-certificates

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN apt-get --assume-yes install golang-go
ENV PATH="/go/bin:${PATH}"
RUN go get -u go.mozilla.org/sops/cmd/sops

RUN curl -LO https://git.io/get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN helm plugin install https://github.com/futuresimple/helm-secrets

RUN ln -sf /bin/bash /bin/sh

RUN mkdir /home/operative
RUN groupadd -r operative && useradd -d /home/operative --no-log-init -g operative operative
RUN chown operative:operative /home/operative 
RUN chmod 777 /home/operative
USER operative
WORKDIR /home/operative
ENV AZURE_CONFIG_DIR=/home/operative
ENV HOME=/home/operative
