#!/bin/bash
source tpcds-env.sh

impala-shell -q "create database $TPCDS_DBNAME;"

impala-shell -d $TPCDS_DBNAME <<EOF
create table et_inventory
(
    inv_date_sk         int,
    inv_item_sk          int,
    inv_warehouse_sk		int,
    inv_quantity_on_hand	int
)

row format delimited fields terminated by '|'
location '${FLATFILE_HDFS_ROOT}/inventory'
tblproperties ('serialization.null.format'='')
;


show tables;
EOF
