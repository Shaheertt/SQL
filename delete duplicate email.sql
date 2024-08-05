CREATE TABLE emails(
    id serial,
    name_s VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL
);

DROP TABLE IF EXISTS emails;


INSERT INTO emails(
    name_s,
    email,
    phone
)VALUES
    ('Rahul','rahul@exmple.com',9839473902),
    ('Rohit','rohit@example.com',9883782971),
    ('Suresh','rahul@exmple.com',7654321098),
    ('Manish','manish@example.com',8927394619),
    ('Amit','amit@example.com',9399303840),
    ('Rahul','rahul@exmple.com',9737466147);
    

-- CREATE TABLE home as
-- SELECT distinct
--     email as em
-- from 
--     emails as home;
--     
-- drop TABLE if EXISTS home;
--     
--     
-- alter TABLE home
-- add COLUMN ids serial;
--     
--     
-- SELECT * FROM home;
-- 
-- SELECT id,name_s,email,phone from emails as e
-- left join home as h on e.id=h.ids
-- where ids is not null;
   
 DROP VIEW IF EXISTS delete_duplicate;
 
CREATE VIEW delete_duplicate AS
SELECT id,email, row_number()OVER( PARTITION BY email) AS RowNumber FROM emails;

SELECT * FROM delete_duplicate;


DELETE FROM emails WHERE id IN (SELECT id FROM delete_duplicate WHERE rownumber>1);
SELECT * FROM emails;
