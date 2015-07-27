#!/bin/bash
CUR_LOCALE=${CTNR_LOCALE:-"en_GB.UTF-8"}
echo "Setting locale: ${CUR_LOCALE}"
locale-gen ${CUR_LOCALE}
update-locale LANG=${CUR_LOCALE} LC_MESSAGES=POSIX

CUR_TIMEZONE=${CTNR_TIMEZONE:-"Europe/London"}
echo "Setting timezone: ${CUR_TIMEZONE}"
echo ${CUR_TIMEZONE} > /etc/timezone; dpkg-reconfigure --frontend noninteractive tzdata

KEYGEN=/usr/bin/ssh-keygen
ROOT_SSH_FOLDER=/root/.ssh
ROOT_KEYFILE=${ROOT_SSH_FOLDER}/id_rsa
SSH_FOLDER=/etc/ssh

if [ ! -f $ROOT_KEYFILE ]; then
  $KEYGEN -q -t rsa -N "" -f ${ROOT_KEYFILE}
  cat ${ROOT_KEYFILE}.pub >> ${ROOT_SSH_FOLDER}/authorized_keys
  ROOT_ID_RSA=$(cat ${ROOT_KEYFILE})

  USER_PASSWORD=$(apg -a 1 -n 1 -m 8 -x 8 -q -M ncl)
  echo "user:${USER_PASSWORD}" | chpasswd
fi

if [ ! -f ${SSH_FOLDER}/ssh_host_dsa_key ] || [ ! -f ${SSH_FOLDER}/ssh_host_rsa_key ] || [ ! -f ${SSH_FOLDER}/ssh_host_ecdsa_key ]; then

  $KEYGEN -q -t dsa -N "" -f ${SSH_FOLDER}/ssh_host_dsa_key
  $KEYGEN -q -t rsa -N "" -f ${SSH_FOLDER}/ssh_host_rsa_key
  $KEYGEN -q -t ecdsa -N "" -f ${SSH_FOLDER}/ssh_host_ecdsa_key

fi

echo "{\"user\": {\"password\": \"${USER_PASSWORD}\"},\"root\": {\"id_rsa\": \"${ROOT_ID_RSA}\"}}"
