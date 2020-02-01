#!/bin/bash

set -x

MELI_IP=192.168.1.12
MELI_PWD="HV*meli8185+"

sshpass -p ${MELI_PWD} scp sh-reader.sh root@${MELI_IP}:/usr/bin
sshpass -p ${MELI_PWD} scp sh-writer.sh root@${MELI_IP}:/usr/bin
sshpass -p ${MELI_PWD} scp lorem-ipsum.txt root@${MELI_IP}:/var/meli/
sshpass -p ${MELI_PWD} scp sh-reader-writer.config root@${MELI_IP}:/etc/meli/
