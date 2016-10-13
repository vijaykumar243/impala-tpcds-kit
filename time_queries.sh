echo "Starting run" > time.log
for x in `seq 1 99`
do
  SECONDS=0
  impala-shell -f ~/impala-tpcds-kit/queries/q${x}.sql -d tpcds_parquet > logs/q${x}.log
  echo $x $? $SECONDS >> time.log
done
