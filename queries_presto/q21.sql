-- start query 21 in stream 0 using template query21.tpl
select  *
 from(select w_warehouse_name
            ,i_item_id
            ,sum(case when (cast(d_date as timestamp) < cast ('2001-03-14' as timestamp))
                        then inv_quantity_on_hand
                      else 0 end) as inv_before
            ,sum(case when (cast(d_date as timestamp) >= cast ('2001-03-14' as timestamp))
                      then inv_quantity_on_hand
                      else 0 end) as inv_after
   from inventory
       ,warehouse
       ,item
       ,date_dim
   where i_current_price between 0.99 and 1.49
     and i_item_sk          = inv_item_sk
     and inv_warehouse_sk   = w_warehouse_sk
     and inv_date_sk    = d_date_sk
     and cast(d_date as timestamp) between (cast ('2001-03-14' as timestamp) - interval '30' day)
                    and (cast ('2001-03-14' as timestamp) + interval '30' day)
   group by w_warehouse_name, i_item_id) x
 where (case when inv_before > 0
             then inv_after / inv_before
             -- then cast(inv_after as double) / cast(inv_before as double)
             else null
             end) between 2.0/3.0 and 3.0/2.0
 order by w_warehouse_name
         ,i_item_id
 limit 100 ;
-- end query 21 in stream 0 using template query21.tpl
