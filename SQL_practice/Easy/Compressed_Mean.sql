SELECT 
  ROUND((SUM(order_occurrences*item_count) 
      / SUM(order_occurrences))::DECIMAL, 1) 
      AS mean
FROM items_per_order