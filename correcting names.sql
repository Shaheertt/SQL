CREATE TABLE nam(
    NAME VARCHAR(255)
);

INSERT INTO nam(
    NAME
)VALUES
    ('rAVI kUMAR'),
    ('priya sharma'),
    ('amit PATEL'),
    ('NEHA gupta');
    
UPDATE nam
SET NAME = INITCAP(NAME);

SELECT * FROM nam;