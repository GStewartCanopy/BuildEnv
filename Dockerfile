FROM phusion/baseimage:0.10.1
LABEL maintainer="Graham Stewart <graham.stewart@findyourcanopy.com>"

RUN	apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
	curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
	apt-get install -y nodejs git openssh-client && \
	rm -f /etc/service/sshd/down && \
	/etc/my_init.d/00_regen_ssh_host_keys.sh && \
	apt-get update && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

