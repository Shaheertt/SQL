CREATE  TABLE bank(
    account_number INT NOT NULL,
    account_holder_name VARCHAR(255) NOT NULL,
    transaction_date date NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    transaction_amount INT NOT NULL
);



INSERT INTO bank(
    account_number,
    account_holder_name,
    transaction_date,
    transaction_type,
    transaction_amount
)VALUES
    (1001,'Ravi Sharma','2023-07-01','Deposit',5000.00),
    (1001,'Ravi Sharma','2023-07-05','Withdrawal',1000.00),
    (1001,'Ravi Sharma','2023-07-01','Deposit',2000.00),
    (1002,'Priya Gupta','2023-07-02','Deposit',3000.00),
    (1002,'Priya Gupta','2023-07-08','Withdrawal',500.00),
    (1003,'Vikram Patel','2023-07-04','Deposit',10000.00),
    (1003,'Vikram Patel','2023-07-09','Withdrawal',2000.00);

DROP  TABLE IF EXISTS bank

SELECT  * FROM bank;

SELECT 
    account_number,
    account_holder_name,
    sum(CASE
            WHEN transaction_type = 'Deposit' THEN transaction_amount
            ELSE - transaction_amount
        END) AS total_balance
FROM 
    bank
GROUP BY
    account_number,
    account_holder_name;