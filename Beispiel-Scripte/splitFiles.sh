#!/usr/bin/env sh

SOURCE=${1}
PARTITIONS=${2}


FILESIZE=$(wc -c ${SOURCE} | awk '{print $1}')
TARGET=$(basename ${SOURCE})
SPLIT_SIZE=$(echo "${FILESIZE}/${PARTITIONS}" | bc)

split -b ${SPLIT_SIZE} ${SOURCE} ${TARGET}_
