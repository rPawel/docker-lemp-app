#!/bin/bash
/etc/init.d/nginx start &
/etc/init.d/exim4 start &
/usr/bin/supervisord
