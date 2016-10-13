#!/bin/bash
source tpcds-env.sh

impala-shell -q "create database $TPCDS_DBNAME;"

impala-shell -d $TPCDS_DBNAME <<EOF
create table et_income_band(
      ib_income_band_sk         int               
,     ib_lower_bound            int                       
,     ib_upper_bound            int
)
row format delimited fields terminated by '|'
location '${FLATFILE_HDFS_ROOT}/income_band'
tblproperties ('serialization.null.format'='')
;


show tables;
EOF
