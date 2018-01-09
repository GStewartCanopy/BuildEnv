############################################################
# Canopy NodeJS Build Image                                #
############################################################

FROM ubuntu:16.04
MAINTAINER Graham Stewart <graham.stewart@findyourcanopy.com>
USER root

ENV LANG C.UTF-8

RUN set -x && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get install -y \
		git \
		curl \
		openssh-client \
		build-essential \
		iptables \
                libltdl7 && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs && \
        curl -s https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.12.0~ce-0~ubuntu_amd64.deb -o docker.deb && \
        dpkg -i docker.deb && \
	apt-get purge -y curl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists