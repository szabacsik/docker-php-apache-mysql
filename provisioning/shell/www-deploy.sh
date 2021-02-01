#!/usr/bin/env bash
rm -f /etc/apache2/sites-enabled/000-default.conf
mv -f /tmp/www/apache.conf /etc/apache2/sites-enabled/apache.conf
rsync /tmp/www/ /srv/www \
  --recursive \
  --checksum \
  --ignore-times \
  --prune-empty-dirs \
  --verbose \
  --human-readable \
  --remove-source-files \
  -og \
  --chown=vagrant:vagrant \
  --perms \
  --chmod=Dug=rwx,Fug=rw,Do=rx,Fo=r
service apache2 restart