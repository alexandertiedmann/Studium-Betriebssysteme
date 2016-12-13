#!/bin/sh

SOURCE=~/Documents/Testbed/datasets/gutenberg/pgdvd072006_extracted/
TARGET=~/Documents/Testbed/datasets/a_only.txt

for file in ${SOURCE}/a*.txt
do
	cat ${file} >> ${TARGET}
done

