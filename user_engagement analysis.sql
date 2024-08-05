rCREATE TABLE posts(
    post_id serial NOT NULL,
    post_content VARCHAR NOT NULL,
    post_date TIMESTAMP NOT NULL
);

SELECT * FROM posts;
----------------------------------------------------------------
INSERT INTO posts(
    post_content,
    post_date
)VALUES
    ('Lorem ipsum dolor sit amet','2023-08-25 10:00:00'),
    ('Exploring the beauty of nature','2023-08-26 15:30:00'),
    ('Unveiling the latest tech trends','2023-08-27 12:00:00'),
    ('Journey into the world of literature','2023-08-28 09:45:00'),
    ('Capturing the essence of city life','2023-08-29 16:20:00');
    
SELECT * FROM posts;
-----------------------------------------------------------------
CREATE TABLE reactions(
    reaction_id serial NOT NULL,
    user_id INT NOT NULL,
    post_ids INT NOT NULL,
    reaction_type VARCHAR(255) NOT NULL,
    reaction_date TIMESTAMP NOT NULL
);
-----------------------------------------------------------------
INSERT INTO reactions(
    user_id,
    post_ids,
    reaction_type,
    reaction_date
)VALUES
    (101,1,'like','2023-08-25 10:15:00'),
    (102,1,'comment','2023-08-25 11:30:00'),
    (103,1,'share','2023-08-26 12:45:00'),
    (101,2,'like','2023-08-26 15:45:00'),
    (102,2,'comment','2023-08-27 09:20:00'),
    (101,2,'comment','2023-08-27 10:00:00'),
    (105,3,'comment','2023-08-27 14:30:00'),
    (101,3,'like','2023-08-28 08:15:00'),
    (103,4,'like','2023-08-28 10:30:00'),
    (105,4,'share','2023-08-29 11:15:00'),
    (104,5,'like','2023-08-29 16:30:00'),
    (101,5,'comment','2023-08-30 09:45:00');
    
    
SELECT * FROM reactions;
----------------------------------------------------------------------
DROP TABLE IF EXISTS reactions;
----------------------------------------------------------------------

SELECT 
    post_id,
    post_content,
    count(CASE WHEN r.reaction_type='like' THEN 1 END) AS num_likes,
    count(CASE WHEN r.reaction_type='comment' THEN 1 END) AS num_comment,
    count(CASE WHEN r.reaction_type='share' THEN 1 END) AS num_share
FROM 
    posts AS p
LEFT JOIN 
    reactions AS r ON p.post_id=r.post_ids
WHERE post_ids=2
GROUP BY
    post_id,
    post_content;
------------------------------------------------------------------------
SELECT date(reaction_date) FROM reactions;

------------------------------------------------------------------------
  
SELECT 
    date(reaction_date) AS reaction_day,
    count(DISTINCT user_id) AS distinct_users,
    count(reaction_type) AS total_reactions,
    round(count(DISTINCT user_id)::DECIMAL,4) AS avg_reaction_per_user
FROM 
    reactions
GROUP BY 
    date(reaction_date);

----------------------------------------------------------------------
SELECT 
    post_id,
    post_content,
    count(r.reaction_type) AS total_reactions
FROM 
    posts AS p LEFT JOIN reactions AS r ON p.post_id=r.post_ids
GROUP BY 
    post_id,
    post_content
ORDER BY total_reactions DESC
LIMIT 3;
----------------------------------------------------------------------------
