CREATE  TABLE market(
    customer_id INT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    purchase_date date NOT NULL,
    quantity INT NOT NULL,
    revenue INT NOT NULL
);

SELECT * FROM market;

INSERT INTO market(
    customer_id,
    product_id,
    purchase_date,
    quantity,
    revenue
)VALUES
    (1,'A','2023-01-01',5,100.00),
    (2,'B','2023-01-02',3,50.00),
    (3,'A','2023-01-03',2,30.00),
    (4,'C','2023-01-03',1,20.00),
    (1,'B','2023-01-04',4,80.00);
    
SELECT * FROM market;

SELECT sum(revenue) FROM market;

SELECT 
    product_id,
    sum(quantity) totalquantity,
    sum(revenue) totalrevenue
FROM
    market
GROUP BY
    product_id
    


SELECT
    customer_id,
    sum(revenue) totalrevenues
FROM
    market
GROUP BY
    customer_id