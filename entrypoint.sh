#!/bin/sh -e


/usr/local/bin/entrypoint.sh /usr/bin/supervisord -nc /etc/supervisord.conf
