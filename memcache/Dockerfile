FROM rpawel/memcache:trusty

ADD ctnr-build.sh /
ADD ctnr-run.sh /

## START
RUN apt-get -q -y update \ 
 && apt-get dist-upgrade -y --no-install-recommends \
 && chmod +x /ctnr-build.sh /ctnr-run.sh \
 && bash /ctnr-build.sh && rm -f /ctnr-build.sh

ADD config/* /etc

# PORTS
EXPOSE 11211

ENTRYPOINT ["/ctnr-run.sh"]
