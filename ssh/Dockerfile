FROM rpawel/ubuntu:trusty

ADD ctnr-run.sh /
ADD ctnr-build.sh /

RUN apt-get -q -y update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && apt-get -y install openssh-server apg \
 && useradd -d /var/www/app --no-create-home --shell /bin/bash -g www-data -G adm user \
 && mkdir -p /var/log/app; chmod 664 /var/log/app/; chown user:www-data /var/log/app/ \
 && chmod +x /ctnr-build.sh /ctnr-run.sh \
 && bash /ctnr-build.sh

ADD config/ssh/sshd_config /etc/ssh/sshd_config
ADD config/supervisord.conf /etc/supervisord.conf

RUN chmod 600 /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key \
 && chmod 600 /root/.ssh/authorized_keys \
 && mkdir -p /var/run/sshd \
 && chmod 700 /root/.ssh && chown -R root /root/.ssh \
 && DEBIAN_FRONTEND=newt

# PORTS
EXPOSE 22

ENTRYPOINT ["/ctnr-run.sh"]