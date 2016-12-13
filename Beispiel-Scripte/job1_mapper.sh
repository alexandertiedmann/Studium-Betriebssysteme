#!/usr/bin/env sh

INPUT_FILE=job1_mapper_input1.txt
OUTPUT_FILE=job1_mapper_output1.txt

cat ${INPUT_FILE} | python ../scripts/job1_mapper.py > ${OUTPUT_FILE}

JOB1_OUTPUT_LINECOUNT=$(wc -l ${OUTPUT_FILE} | awk '{print $1}')

#print output
echo "output file:"
echo
cat ${OUTPUT_FILE}

if [ ${JOB1_OUTPUT_LINECOUNT} -ne "6" ]
then
    echo "-------"
    echo "fail"
    exit -1
fi


echo
echo "-------"
echo "success"
