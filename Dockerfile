FROM phusion/baseimage:0.10.1
LABEL maintainer="Graham Stewart <graham.stewart@findyourcanopy.com>"

RUN	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
	apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
	curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
	apt-get install -y nodejs git openssh-client openjdk-8-jdk-headless python-pip python-dev build-essential docker-ce ruby-dev build-essential --no-install-recommends && \
	pip install -U setuptools && \
	pip install --upgrade awscli && \
        gem install fastlane && \
        apt-get purge -y build-essential && \
	rm -f /etc/service/sshd/down && \
	/etc/my_init.d/00_regen_ssh_host_keys.sh && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

