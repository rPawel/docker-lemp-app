FROM rpawel/ubuntu:trusty

ADD ctnr-run.sh /
ADD ctnr-build.sh /

RUN apt-get -q -y update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && apt-get -y install openssh-server apg \
 && useradd -d /var/www/app --no-create-home --shell /bin/bash -g www-data -G adm user \
 && mkdir -p /var/log/app; chmod 664 /var/log/app/; chown user:www-data /var/log/app/ \
 && chmod +x /ctnr-build.sh /ctnr-run.sh \
 && bash /ctnr-build.sh \
 && mkdir -p /var/run/sshd \
 && DEBIAN_FRONTEND=newt

ADD config/ssh/sshd_config /etc/ssh/sshd_config
ADD config/supervisord.conf /etc/supervisord.conf

# PORTS
EXPOSE 22

ENTRYPOINT ["/ctnr-run.sh"]
