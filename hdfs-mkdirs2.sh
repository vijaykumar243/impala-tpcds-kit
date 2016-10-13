#!/bin/bash
source tpcds-env.sh

# make the table level dir
hdfs dfs -mkdir ${FLATFILE_HDFS_ROOT}

# make a directory for each table
for t in warehouse call_center reason catalog_page web_page income_band web_site catalog_sales catalog_returns web_sales web_returns
do 
  echo "making HDFS directory ${FLATFILE_HDFS_ROOT}/${t}"
  hdfs dfs -mkdir ${FLATFILE_HDFS_ROOT}/${t}
done

echo "HDFS directories:"
hdfs dfs -ls ${FLATFILE_HDFS_ROOT}
