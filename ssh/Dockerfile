FROM rpawel/php-ssh:trusty

ADD ctnr-run.sh /
ADD ctnr-build.sh /

RUN apt-get -q -y update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && chmod +x /ctnr-build.sh /ctnr-run.sh \
 && bash /ctnr-build.sh \
 && DEBIAN_FRONTEND=newt

# PORTS
EXPOSE 22

ENTRYPOINT ["/ctnr-run.sh"]
