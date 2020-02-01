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

function monitoring_uart() {

	i=0
	for i in {1..10}; do

		echo "Attempt ${i}/10 to read uart ..."

		read -rs -t $UART_READ_TIMEOUT str < $UART_DEVICE_WRITE
		if [ -n "$str" ]; then
			result="[$(date)]:${str}"
			echo "saving:${result}"
			echo "${result}" >> ${OUTPUT_FILE}
		fi
	done
}

monitoring_uart