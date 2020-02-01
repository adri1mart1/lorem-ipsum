#!/bin/bash

# set -x 

CONF_FILE=/etc/meli/sh-reader-writer.config

function on_error() {
	echo "Error:${1}"
	exit 1
}

if [ ! -f ${CONF_FILE} ]; then
	on_error "config file:${CONF_FILE} doesn't exists, abording..."
fi

source ${CONF_FILE}

function send_file_via_uart() {
	echo "$(cat ${LOREM_IPSUM_FILE})" > ${UART_DEVICE_READ}
}

send_file_via_uart