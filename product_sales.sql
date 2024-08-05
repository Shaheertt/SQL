CREATE TABLE product(
    product_id serial NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL
);

SELECT * FROM product;

INSERT INTO product(
    product_name,
    price
)VALUES
    ('Apple',2.50),
    ('Banana',1.50),
    ('Orange',3.00),
    ('Mango',2.00);
    
SELECT * FROM product;

CREATE TABLE orders(
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    sales FLOAT NOT NULL
);



INSERT INTO orders(
    order_id,
    product_id,
    quantity,
    sales
)VALUES
    (1,1,10,25),
    (2,1,5,12.50),
    (3,2,8,12),
    (4,3,12,36),
    (5,4,6,12);
    
SELECT * FROM orders;

CREATE TABLE sale AS
SELECT product_name,sales FROM product AS P
LEFT JOIN orders AS o ON p.product_id=o.product_id;

SELECT * FROM sale;

SELECT 
    product_name,
    sum(sales) total_revenue
FROM
    sale
GROUP BY
    product_name;
