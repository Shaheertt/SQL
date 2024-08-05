CREATE TABLE trips(
    id serial NOT NULL,
    client_id INT NOT NULL,
    driver_id INT NOT NULL,
    city_id INT NOT NULL,
    status VARCHAR(255) NOT NULL,
    request_at date NOT NULL
);

INSERT INTO trips(
    client_id,
    driver_id,
    city_id,
    status,
    request_at
)VALUES
    (1,10,1,'completed','2023-07-12'),
    (2,11,1,'cancelled_by_driver','2023-07-12'),
    (3,12,6,'completed','2023-07-12'),
    (4,13,6,'cancelled_by_client','2023-07-12'),
    (1,10,1,'completed','2023-07-13'),
    (2,11,6,'completed','2023-07-13'),
    (3,12,6,'completed','2023-07-13'),
    (2,12,12,'completed','2023-07-14'),
    (3,10,12,'completed','2023-07-14'),
    (4,13,12,'cancelled_by_driver','2023-07-14');
    
SELECT * FROM trips;

--------------------------------------------------------------------------

CREATE TABLE users(
    user_id INT NOT NULL,
    banned VARCHAR(255) NOT NULL,
    ROLE VARCHAR(255) NOT NULL
);

INSERT INTO users(
    user_id,
    banned,
    ROLE
)VALUES
    (1,'No','client'),
    (2,'Yes','client'),
    (3,'No','client'),
    (4,'No','client'),
    (10,'No','driver'),
    (11,'No','driver'),
    (12,'No','driver'),
    (13,'No','driver');

SELECT * FROM users;
-----------------------------------------------------------
CREATE VIEW rocky AS (
    SELECT 
        t.request_at AS DAY,
        count(CASE WHEN t.status LIKE 'cancelled%' THEN 1 END) AS cancelled_request,
        count(*) AS total_requests
    FROM
        trips t
        JOIN users u1 ON t.client_id=u1.user_id
        JOIN users u2 ON t.driver_id=u2.user_id
    WHERE
        u1.banned = 'No' AND u2.banned = 'No'
    GROUP BY 
        t.request_at
);

SELECT * FROM rocky;
--------------------------------------------------------------------------------------------

SELECT DAY,round(cancelled_request::NUMERIC/total_requests,2) AS cancelled_rate
FROM rocky
GROUP BY DAY,cancelled_rate;