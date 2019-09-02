FROM atlassian/default-image:2

ENV GOPATH /go
ENV HELM_HOME /helm
RUN mkdir /helm
RUN mkdir /helm/plugins

RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt-get update
RUN apt-get --assume-yes install ca-certificates

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install Go and Mozilla SOPS
RUN apt-get --assume-yes install golang-go
ENV PATH="/go/bin:${PATH}"
RUN go get -u go.mozilla.org/sops/cmd/sops

# Install Helm and Helm Secrets plugin
RUN curl -LO https://git.io/get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN helm plugin install https://github.com/futuresimple/helm-secrets