#!/bin/bash
/etc/init.d/nginx start &
/etc/init.d/sendmail start &
/usr/bin/supervisord