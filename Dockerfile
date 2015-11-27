FROM resin/rpi-raspbian

MAINTAINER Robbin Habermehl <robbin@habermehl.net>

RUN apt-get update && apt-get install -yqq \
      curl \
      openssh-server \
      ca-certificates \
      postfix \
      apt-transport-https && \
      curl https://packages.gitlab.com/gpg.key | apt-key add -

RUN curl -o /etc/apt/sources.list.d/gitlab_ce.list \
      "https://packages.gitlab.com/install/repositories/gitlab/raspberry-pi2/config_file.list?os=debian&dist=wheezy" && \
      apt-get update && \
      apt-get install gitlab-ce

EXPOSE 80

CMD ["gitlab-ctl reconfigure"]
