SELECT repo_name, trailer
FROM `bigquery-public-data.github_repos.sample_commits`

SELECT repo_name, ARRAY(
  SELECT AS STRUCT key, value, email
  FROM UNNEST(trailer)
) AS trailer
FROM `bigquery-public-data.github_repos.sample_commits`

SELECT repo_name, key, value, email
FROM `bigquery-public-data.github_repos.sample_commits` 
CROSS JOIN UNNEST(trailer) as trailer 

SELECT repo_name, trailer
FROM `bigquery-public-data.github_repos.sample_commits` 

-- #standardSQL
SELECT
  *
FROM
  `bigquery-public-data.hacker_news.stories` AS s
WHERE
  s.score is NOT null AND s.score != 0
LIMIT
  500

SELECT
 name, count
FROM
 `babynames.names_2014`
WHERE
 gender = 'M'
ORDER BY count DESC LIMIT 5

SELECT email
FROM (
  SELECT repo_name, key, value, email
  FROM `bigquery-public-data.github_repos.sample_commits` 
  CROSS JOIN UNNEST(trailer) as trailer 
)
WHERE email = "e5c0b4cdf99ae1d408b9c497159e74b54e02e008@ti.com";