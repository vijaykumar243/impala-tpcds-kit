#!/bin/bash
source tpcds-env.sh

impala-shell -q "create database $TPCDS_DBNAME;"

impala-shell -d $TPCDS_DBNAME <<EOF
create table et_ship_mode(
      sm_ship_mode_sk           int               
,     sm_ship_mode_id           string              
,     sm_type                   string                      
,     sm_code                   string                      
,     sm_carrier                string                      
,     sm_contract               string                      
)
row format delimited fields terminated by '|'
location '${FLATFILE_HDFS_ROOT}/ship_mode'
tblproperties ('serialization.null.format'='')
;


show tables;
EOF
