#!/bin/bash
source tpcds-env.sh

impala-shell -d $TPCDS_DBNAME <<EOF
create table call_center like et_call_center stored as parquetfile;
insert overwrite table call_center select * from et_call_center;

create table catalog_page like et_catalog_page stored as parquetfile;
insert overwrite table catalog_page select * from et_catalog_page;

create table income_band like et_income_band stored as parquetfile;
insert overwrite table income_band select * from et_income_band;

create table reason like et_reason stored as parquetfile;
insert overwrite table reason select * from et_reason;

create table ship_mode like et_ship_mode stored as parquetfile;
insert overwrite table ship_mode select * from et_ship_mode;

create table web_page like et_web_page stored as parquetfile;
insert overwrite table web_page select * from et_web_page;

create table web_site like et_web_site stored as parquetfile;
insert overwrite table web_site select * from et_web_site;

create table warehouse like et_warehouse stored as parquetfile;
insert overwrite table warehouse select * from et_warehouse;

show tables;
EOF
