SELECT
  CONCAT(A.topping_name, ', ', B.topping_name, ', and ', C.topping_name)
    AS pizza,
  A.ingredient_cost + B.ingredient_cost + C.ingredient_cost
    AS total_cost
FROM pizza_toppings AS A, pizza_toppings AS B, pizza_toppings AS C
WHERE (A.topping_name < B.topping_name)
  AND (B.topping_name < C.topping_name)
ORDER BY total_cost DESC, A.topping_name, B.topping_name, C.topping_name;