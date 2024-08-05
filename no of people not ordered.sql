CREATE  TABLE customers(
    id INT NOT NULL,
    customer_name VARCHAR(255) NOT NULL
);

SELECT * FROM customers;

INSERT INTO customers(
    id,
    customer_name
)VALUES
    (1,'joe'),
    (2,'Henry'),
    (3,'Sam'),
    (4,'Max');
    
SELECT * FROM customers;

CREATE  TABLE orders(
    id INT NOT NULL,
    customerid INT NOT NULL
);

SELECT * FROM orders;

INSERT INTO orders(
    id,
    customerid
)VALUES
    (2,1),
    (1,3);
    
SELECT * FROM orders;

SELECT customer_name FROM customers AS c
LEFT JOIN orders AS o ON c.id=o.customerid
WHERE customerid IS NULL;


