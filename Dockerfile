FROM phusion/baseimage:0.10.1

RUN	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update 
RUN apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - 
RUN apt-get install -y nodejs git openssh-client openjdk-8-jdk-headless python-pip python-dev build-essential docker-ce unzip jq rpl bzip2 --no-install-recommends
RUN curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy | tee /usr/bin/ecs-deploy 
RUN chmod +x /usr/bin/ecs-deploy
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN rvm install 2.7
RUN rvm use 2.7
RUN ruby --version
RUN curl -sL firebase.tools | bash
RUN pip install -U setuptools
RUN pip install --upgrade awscli
RUN gem install fastlane -NV
RUN apt-get purge -y build-essential
RUN rm -f /etc/service/sshd/down
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

