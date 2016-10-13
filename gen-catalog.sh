#!/bin/bash
source tpcds-env.sh

# find out what our node number is
source nodenum.sh

count=$DSDGEN_THREADS_PER_NODE

start=(NODENUM-1)*$count+1

# hard coded for the catalog tables for now
t=catalog_sales
t2=catalog_returns

for (( c=$start; c<($count+$start); c++ ))
do
  echo "Generating part $c of ${DSDGEN_TOTAL_THREADS}"
  ${TPCDS_ROOT}/tools/dsdgen \
    -TABLE $t \
    -SCALE ${TPCDS_SCALE_FACTOR} \
    -CHILD $c \
    -PARALLEL ${DSDGEN_TOTAL_THREADS} \
    -DISTRIBUTIONS ${TPCDS_ROOT}/tools/tpcds.idx \
    -TERMINATE N \
    -_FILTER Y \
    -QUIET Y 
  hdfs dfs -put ${t}_${c}_${DSDGEN_TOTAL_THREADS}.dat  ${FLATFILE_HDFS_ROOT}/${t}/${t}_${c}_${DSDGEN_TOTAL_THREADS}.dat 
  rm ${t}_${c}_${DSDGEN_TOTAL_THREADS}.dat
  hdfs dfs -put ${t2}_${c}_${DSDGEN_TOTAL_THREADS}.dat  ${FLATFILE_HDFS_ROOT}/${t2}/${t2}_${c}_${DSDGEN_TOTAL_THREADS}.dat 
  rm ${t2}_${c}_${DSDGEN_TOTAL_THREADS}.dat
done
