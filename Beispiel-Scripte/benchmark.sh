#/bin/sh


PROZESSE=2
LOGDATEI='~/mpiTest20100907.csv'


FILES="1048576.data 67108864.data 268435456.data 268435456.data_2010-07-22 1073741824.data"
for filename in `echo $FILES`
do
  FULLPATH="/tmp/$filename"
  echo "mpiexec -n $PROZESSE ./main $FULLPATH >> $LOGDATEI"
done

