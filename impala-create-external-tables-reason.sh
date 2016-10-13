#!/bin/bash
source tpcds-env.sh

impala-shell -q "create database $TPCDS_DBNAME;"

impala-shell -d $TPCDS_DBNAME <<EOF
create table et_reason(
      r_reason_sk               int               
,     r_reason_id               string              
,     r_reason_desc             string                
)
row format delimited fields terminated by '|'
location '${FLATFILE_HDFS_ROOT}/reason'
tblproperties ('serialization.null.format'='')
;


show tables;
EOF
