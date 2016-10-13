#!/bin/bash
source tpcds-env.sh

impala-shell -q "create database $TPCDS_DBNAME;"

impala-shell -d $TPCDS_DBNAME <<EOF
create table et_warehouse(
      w_warehouse_sk            int               
,     w_warehouse_id            string              
,     w_warehouse_name          string                   
,     w_warehouse_sq_ft         int                       
,     w_street_number           string                      
,     w_street_name             string                   
,     w_street_type             string                      
,     w_suite_number            string                      
,     w_city                    string                   
,     w_county                  string                   
,     w_state                   string                       
,     w_zip                     string                      
,     w_country                 string                   
,     w_gmt_offset              float                  
)
row format delimited fields terminated by '|'
location '${FLATFILE_HDFS_ROOT}/warehouse'
tblproperties ('serialization.null.format'='')
;


show tables;
EOF
