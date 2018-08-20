FROM ubuntu

RUN 	apt-get update \
#	&& apt-get install -y apt-utils \
	&& apt-get install -y ca-certificates bash git nano curl gnupg bash-completion

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
	&& touch /etc/apt/sources.list.d/kubernetes.list \
 	&& echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update

RUN apt-get install -y kubectl \
	&& curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash


RUN echo "source /etc/bash_completion" >> /root/.bashrc \
	&& echo "source <(kubectl completion bash)" >> /root/.bashrc

ENV KUBE_EDITOR nano

WORKDIR /config

CMD bash
