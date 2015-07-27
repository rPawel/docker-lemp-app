FROM rpawel/lemp:trusty

ADD config/* /etc/
ADD ctnr-build.sh /
ADD ctnr-run.sh /

## START
RUN apt-get -q -y update \ 
 && apt-get dist-upgrade -y --no-install-recommends \
 && crontab -u user /etc/app.cron \
 && chmod +x /ctnr-build.sh /ctnr-run.sh \
 && bash /ctnr-build.sh && rm -f /ctnr-build.sh

# PORTS
EXPOSE 80

ENTRYPOINT ["/ctnr-run.sh"]