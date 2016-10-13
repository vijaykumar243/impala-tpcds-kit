#!/bin/bash
source tpcds-env.sh

for t in inventory warehouse call_center reason catalog_page web_page income_band web_site ship_mode
do
  echo "Generating table $t"
  ${TPCDS_ROOT}/tools/dsdgen \
    -TABLE $t \
    -SCALE ${TPCDS_SCALE_FACTOR} \
    -DISTRIBUTIONS ${TPCDS_ROOT}/tools/tpcds.idx \
    -TERMINATE N \
    -_FILTER Y \
    -QUIET Y 
   hdfs dfs -put ${t}.dat ${FLATFILE_HDFS_ROOT}/${t}/${t}.dat 
   rm ${t}.dat
done
wait

hdfs dfs -ls -R ${FLATFILE_HDFS_ROOT}/*/*.dat
