FROM ubuntu

RUN 	apt-get update \
	&& apt-get install -y ca-certificates bash git curl gnupg

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
	&& touch /etc/apt/sources.list.d/kubernetes.list \
 	&& echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update

RUN apt-get install -y kubectl
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

WORKDIR /config

CMD bash
