CREATE TABLE ads(
    adid serial NOT NULL,
    view_s INT NOT NULL,
    clicks INT NOT NULL,
    cos_t FLOAT NOT NULL
);

INSERT INTO ads(
    view_s,
    clicks,
    cos_t
)VALUES
    (1000,50,20.5),
    (800,30,15.2),
    (1200,80,25.7),
    (600,20,10.9),
    (1500,120,40.3);
    
SELECT 
    adid,
    round((clicks::DECIMAL/view_s)*100,1) AS ctr,
    view_s,
    clicks,
    cos_t
FROM
    ads;
