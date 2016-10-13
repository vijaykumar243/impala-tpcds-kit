#!/bin/bash
source tpcds-env.sh

impala-shell -d $TPCDS_DBNAME <<EOF
compute stats call_center;
compute stats catalog_page;
compute stats catalog_returns;
compute stats catalog_sales;
compute stats income_band;
compute stats inventory;
compute stats reason;
compute stats ship_mode;
compute stats store_returns;
compute stats warehouse;
compute stats web_page;
compute stats web_returns;
compute stats web_sales;
compute stats web_site;

EOF
