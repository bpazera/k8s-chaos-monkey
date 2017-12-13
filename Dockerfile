FROM oberthur/docker-ubuntu-java:openjdk-8u131b11

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  curl python nano

ARG KUBECTL_URL=https://storage.googleapis.com/kubernetes-release/release/v1.5.7/bin/linux/amd64/kubectl
RUN cd /usr/local/bin && curl -O $KUBECTL_URL && chmod 755 kubectl

WORKDIR /usr/src/app
COPY chaos.sh ./
COPY parse_json.py ./
CMD ["bash", "/usr/src/app/chaos.sh"]
