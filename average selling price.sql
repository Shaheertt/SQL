
CREATE TABLE product(
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    selling_price INT NOT NULL
);


INSERT INTO product(
    product_id,
    product_name,
    selling_price
)VALUES
(1,'product_a',100),
(2,'product_b',150),
(1,'product_a',120),
(3,'product_c',200),
(2,'product_b',180),
(1,'product_a',90),
(3,'product_c',210);

SELECT * FROM product;

SELECT 
    product_name,
    round(avg(selling_price),6) average
FROM
    product
GROUP BY
    product_name